<script runat="server">
Platform("Core", "2.0");
var api = new Script.Util.WSProxy();
var nameDE = 'Atualizacao Flag Delete Cliente Parceiro';
var SOBJECTTYPE = 'HC_Relacao_Cliente_Parceiro__c';
var deCustomerkey = retrieveDECustomerKeyFromName(api, nameDE);
var urlToUpsert = 'https://brasilcap.my.salesforce.com/services/data/v54.0/composite/';
var BATCH_SIZE = 1000;
var MAX_COMPOSITE_SUBREQUEST_SIZE = 200;
var logDEName = 'Log Integracao Flag Cliente Parceiro';
var logDECustomerKey = retrieveDECustomerKeyFromName(api, logDEName);
var START_TIME = new Date().getTime();
var MAX_EXECUTION_TIME_MILISECONDS = 60 * 28 * 1000;
var DATETIME_ENVIO;

// Faz depara de campos (<nome_do_campo_DE> : <nome_do_campo_Payload>)
var DEPARACAMPOS = {
  "Id": "Id"
}

// Usar caso haja valores para inserir carimbados (que não são variáveis de acordo com a base)
var VALORESFIXOS = {
  "HC_CustomerToBeDeleted_Flg__c": true
}

// DE OTC291 filtrado
var campoPKNoDEParaAtualizar = 'Id';

// Formatar campos de data para formato YYYY-MM-DD
// Usar lado direito no caso do objeto deparaCampos
// var dateFieldsToFormat = [
//   'Date'
// ];

// Aplicar um filtro para trazer do DE apenas linhas desejadas
var applyFilterRetrieve = true; // flag para usar o filtro "filterRetrieveRows"
// Campo para atualizar o DE informando que um contato já teve a tentativa de disparo
// Para caso o Script precise ser executado novamente
var flagEnvioParaService = 'Enviado';
var filterRetrieveRows = {
  Property: flagEnvioParaService,
  SimpleOperator: 'equals',
  Value: false
}

// Configs


try {
  var deCustomerkey = retrieveDECustomerKeyFromName(api, nameDE);
  var requestAccessTokenFunction = eval(Platform.Function.TreatAsContent( Platform.Function.ContentBlockByID('56359') ));
  var access_token = requestAccessTokenFunction();
  
  var recordManipulator = DataExtensionRecordsOperator({api: api, dataExtensionName: nameDE});
  
  recordManipulator.pipeExecuteInAllRecords({filter: filterRetrieveRows}, myCallback, BATCH_SIZE);
  
  function myCallback(records){
    var currentRecords = records;
    var payloadComposite = {
      "allOrNone" : false,
      "collateSubrequests": false,
      "compositeRequest": []
    }
    var currentRecord = {};
    // var indexSubrequest = 0;
    var queueToNextRequest = []; // Para quando não houver espaço para o envio num mesmo compositeRequest
  
    // Write('Starting' + '\n');
  
    while(currentRecords.length > 0){
      // Write('currentRecords.length' + '\n');
      // Write(Stringify(currentRecords.length) + '\n\n');
      currentRecord = currentRecords.shift();
      var requestMethodForRecord = getMethodForRecord(currentRecord);
  
  
      var indexToInsertRecord = getIndexToInsertRecord(payloadComposite, requestMethodForRecord);
      if(indexToInsertRecord >= 5){
        // Não é possível inserir o contato nesse request, tentar na próxima request
        queueToNextRequest.push(currentRecord);
      }else{
        payloadComposite = insereRecordNoPayload(payloadComposite, currentRecord, indexToInsertRecord, requestMethodForRecord);
      }
      
      
      // Fazer envio quando não há mais records para ser avaliados, ou quando o payload está com carga máxima
      if(currentRecords.length == 0 || payloadCompositeNaCapacidadeMaxima(payloadComposite)){
        // Logica de envio
        DATETIME_ENVIO = new Date();
        var resp = enviarDadosParaService(payloadComposite);
        
        // Guardar resposta
        var response = Platform.Function.ParseJSON('' + resp.content); // trata resposta
        updateDEResposta(payloadComposite, response);
  
        // limpar base de envio
        payloadComposite.compositeRequest = [];
      }
  
      // Reinicia a fila, quando já tentou enviar todos os registros      
      if(queueToNextRequest.length > 0 && currentRecords.length == 0){
        // Write('Restarting Queue' + '\n');
        currentRecords = queueToNextRequest;
      }
  
      currentRecord = {};
    }
  
  }
  
  } catch (error) {
  // Write('error' + '\n');
  // Write(Platform.Function.Stringify(error) + '\n\n');
  insertBulkRecordInDE(api, [{Data_Sent:Platform.Function.Stringify(error)}], logDECustomerKey);
  }
  
  function createSingleRecordComposite(record, sObjectType, deparaCampos, valoresFixos){
  var recordFormated = {
    "attributes": {
      "type": sObjectType
    }
  }
  
  for (var key in deparaCampos) {
    recordFormated[ deparaCampos[key] ] = record[key];
  }
  
  // se houver algum valor fixo, inserir no payload
  if(valoresFixos){
    for (var key in valoresFixos) {
      recordFormated[ key ] = valoresFixos[key];
    }
  }
  
  // formata campo de data se houver
  for(var key in recordFormated){
    if(key == "attributes") continue
    
    if(dateFieldsToFormat && dateFieldsToFormat.length > 0){
      for (var i = 0; i < dateFieldsToFormat.length; i++) {
        if(key == dateFieldsToFormat[i]){
          recordFormated[key] = formatDate(recordFormated[key]);
        }
      }
    }
  }
  
  return recordFormated;
  }
  
  function recordUpdateCampaignMemberCompositePayload(record, sObjectType){
  var recordFormated = {
    "attributes": {
      "type": sObjectType
    }
  }
  
  recordFormated.Id = record[DEPARACAMPOID_SERVICE];
  recordFormated[ DEPARACAMPOS[campoPKNoDEParaAtualizar] ] = record[campoPKNoDEParaAtualizar];
  recordFormated.HC_DISPARO_CAMPANHA__c = formatDate( new Date() );
  
  return recordFormated;
  }
  
  function DataExtensionRecordsOperator(configuration){
  var api;
  var customerKey;
  
  if(!configuration) Platform.Function.RaiseError('An configuration Object is required');
  if(!configuration.api) Platform.Function.RaiseError('Api attribute is required');
  if(!configuration.dataExtensionCustomerKey && !configuration.dataExtensionName) Platform.Function.RaiseError('dataExtensionCustomerKey or dataExtensionName attribute is required');
  if(configuration.dataExtensionCustomerKey && typeof configuration.dataExtensionCustomerKey != 'string') Platform.Function.RaiseError('dataExtensionCustomerKey must be a String');
  api = configuration.api;
  
  if(configuration.dataExtensionCustomerKey == null || configuration.dataExtensionCustomerKey == ''){
    var simpleFilter = {
      Property: 'Name',
      SimpleOperator: 'equals',
      Value: configuration.dataExtensionName
    }
    customerKey = api.retrieve("DataExtension", ["CustomerKey"], simpleFilter).Results[0].CustomerKey;
  }else{
    customerKey = configuration.dataExtensionCustomerKey;
  }
  
  function getRecords(options){
    // options Object can have filter or headers
    if(!!options && typeof options != 'object') Platform.Function.RaiseError('Options must be an object or omitted');
        
    var headers;
    var filter;
  
    if(!!options && options.headers){
      headers = options.headers;
    }else{
      headers = retrieveFieldNames(customerKey, api);
    }
  
    if(!!options && options.filter) filter = options.filter;
  
    var config = {
      customerKey: customerKey,
      cols: headers
    }
  
    var records = [],
    moreData = true,
    reqID = data = null;
  
    while (moreData) {
      moreData = false;
      if (reqID == null) {
        if(filter == undefined || filter == null){
          data = api.retrieve("DataExtensionObject[" + config.customerKey + "]", config.cols);
        }else{
          data = api.retrieve("DataExtensionObject[" + config.customerKey + "]", config.cols, filter);
        }
        if(data.Status.substring(0, 5) == 'Error'){
          Platform.Function.RaiseError('Something went wrong: ' + data.Status);
        }
      } else {
        data = api.getNextBatch("DataExtensionObject[" + config.customerKey + "]", reqID);
      }
  
      if (data != null) {
        moreData = data.HasMoreRows;
        reqID = data.RequestID;
        for (var i = 0; i < data.Results.length; i++) {
          var result_list = data.Results[i].Properties;
          var obj = {};
          for (k in result_list) {
            var key = result_list[k].Name;
            var val = result_list[k].Value
            if (key.indexOf("_") != 0) obj[key] = val;
          }
        records.push(obj);
        }
      }
    }
    return records;
    
  }
  
  function pipeExecuteInAllRecords(options, cb, batchSize){
    // options Object can have filter or headers
    if(!!options && typeof options != 'object') Platform.Function.RaiseError('Options must be an object or omitted');
    var batchSizeActual = batchSize == null || batchSize == undefined ? 2500 : batchSize;
    batchSizeActual = batchSizeActual > 2500 ? 2500 : batchSizeActual;
    if(batchSizeActual == 0) Platform.Function.RaiseError('batchSize cannot be 0');
        
    var filter;
    headers = retrieveFieldNames(customerKey, api);
  
    if(!!options && options.filter) filter = options.filter;
  
    var config = {
      customerKey: customerKey,
      cols: headers
    }
  
    var records = [],
    moreData = true,
    reqID = data = null;
  
    while (moreData) {
      moreData = false;
      if (reqID == null) {
        if(filter == undefined || filter == null){
          data = api.retrieve("DataExtensionObject[" + config.customerKey + "]", config.cols);
        }else{
          data = api.retrieve("DataExtensionObject[" + config.customerKey + "]", config.cols, filter);
        }
        if(data.Status.substring(0, 5) == 'Error'){
          Platform.Function.RaiseError('Something went wrong: ' + data.Status);
        }
      } else {
        data = api.getNextBatch("DataExtensionObject[" + config.customerKey + "]", reqID);
      }
  
      if (data != null) {
        moreData = data.HasMoreRows;
        reqID = data.RequestID;
        var retrievedData = data.Results;
        while ( retrievedData.length != 0 ) {
          var currentData = retrievedData.splice(0, batchSizeActual);
          for (var i = 0; i < currentData.length; i++) {
            var result_list = currentData[i].Properties;
            var obj = {};
            for (k in result_list) {
              var key = result_list[k].Name;
              var val = result_list[k].Value
              if (key.indexOf("_") != 0) obj[key] = val;
            }
            records.push(obj);
          }
          cb(records); // operate over the first Chunck
          records = []; // clear records, free up memory
          // Se estiver em um tempo próximo de ocorrer erro por timeout na atividade de execução de script,
          // interrompe a execução
          if(START_TIME != null && START_TIME != undefined && (new Date().getTime() - START_TIME > MAX_EXECUTION_TIME_MILISECONDS)){
            moreData = false;
          }
        }
      }
    }
  }
  
  function retrieveFieldNames(customerKey, api) {
    var filter = {
      Property: "DataExtension.CustomerKey",
      SimpleOperator: "equals",
      Value: customerKey
    };
  
    var req = api.retrieve("DataExtensionField", ["Name"], filter);
    var fields = req.Results;
    var out = [];
    for (k in fields) {
      out = out.concat(fields[k].Name);
    }
    return out;
  }
  
  return {
    getRecords: getRecords,
    pipeExecuteInAllRecords: pipeExecuteInAllRecords
  }
  }
  
  function retrieveDECustomerKeyFromName(api, dataExtensionName){
  var simpleFilter = {
    Property: 'Name',
    SimpleOperator: 'equals',
    Value: dataExtensionName
  }
  var result = api.retrieve('DataExtension', ['CustomerKey'], simpleFilter);
  if(result.Status != 'OK' || result.Results.length < 1){
    return null
  }else{
    return result.Results[0].CustomerKey;
  }
  }
  
  function formatDate(date) {
  var d = new Date(date),
      month = '' + (d.getMonth() + 1),
      day = '' + d.getDate(),
      year = d.getFullYear()
  if (month.length < 2) 
      month = '0' + month;
  if (day.length < 2) 
      day = '0' + day;
  hours = hours.length < 2 ? '0' + hours : hours;
  minutes = minutes.length < 2 ? '0' + minutes : minutes;
  seconds = seconds.length < 2 ? '0' + seconds : seconds;
  var formattedDate = year + '-' + month + '-' + day;
  return formattedDate;
  }
  
  function insertBulkRecordInDE(api, records, customerKey){
  if(!api) Platform.Function.RaiseError('Api param is required');
  var data = [];
  for(var recordIndex = 0; recordIndex < records.length ; recordIndex++){
    var record = records[recordIndex];
    var props = [];
    for (prop in record) {
      props.push({ Name: prop, Value: record[prop] });
    }
    data.push({
      CustomerKey: customerKey,
      Properties: props
    });
  }
  return api.createBatch('DataExtensionObject', data);
  }
  
  function upsertBulkRecordInDE(api, records, customerKey){
  if(!api) Platform.Function.RaiseError('Api param is required');
  var data = [];
  for(var recordIndex = 0; recordIndex < records.length ; recordIndex++){
    var record = records[recordIndex];
    var props = [];
    for (prop in record) {
      props.push({ Name: prop, Value: record[prop] });
    }
    data.push({
      CustomerKey: customerKey,
      Properties: props
    });
  }
  return api.updateBatch('DataExtensionObject', data, {SaveOptions: [{'PropertyName': '*', SaveAction: 'UpdateAdd'}]});
  }
  
  function createCompositeSubrequest(method, refId){
  return  {
    "method" : method,
    "url" : "/services/data/v54.0/composite/sobjects/",
    "referenceId": refId,
    "body" : {
      "allOrNone" : false,
      "records" : [
      ]
    }
  }
  }
  
  function getMethodForRecord(record){
  // if(record.Id_Membro_Campanha == null || record.Id_Membro_Campanha == undefined || record.Id_Membro_Campanha == '') return 'POST';
  return 'PATCH';
  }
  
  function getIndexToInsertRecord(payloadComposite, requestMethod){
  // verificar se o metodo na subrequest atual (POST ou PATCH) é o mesmo do record atual
  // e se há espaço para enviar esse record (max 200 records por subrequest)
  var indexSubrequest = 0;
  for(indexSubrequest = 0; indexSubrequest < 5 ; indexSubrequest++){
  
    // Ainda não existe essa subrequest, então o contato pode ser inserido nesse index
    if(!payloadComposite.compositeRequest[indexSubrequest]) return indexSubrequest;
    
    // existe um objeto e ele é do mesmo method
    if(payloadComposite.compositeRequest[indexSubrequest].method == requestMethod 
      && payloadComposite.compositeRequest[indexSubrequest].body.records.length < MAX_COMPOSITE_SUBREQUEST_SIZE) return indexSubrequest;
  }
  return indexSubrequest;
  }
  
  function payloadCompositeNaCapacidadeMaxima(payloadComposite){
  for(var i = 0; i < 5 ; i++){
    // Ainda não existe essa subrequest, então não está completo
    if(!payloadComposite.compositeRequest[i]) return false;
    
    // existe um objeto e ele é do mesmo method
    if(payloadComposite.compositeRequest[i].body.records.length < MAX_COMPOSITE_SUBREQUEST_SIZE) return false;
  }
  return true;
  }
  
  function insereRecordNoPayload(payloadComposite, record, indexToInsertRecord, requestMethodForRecord){
  // Confere se há um composite subrequest criado e insere (ou cria e insere)
  if(!payloadComposite.compositeRequest[indexToInsertRecord]) payloadComposite.compositeRequest.push(createCompositeSubrequest(requestMethodForRecord, 'request'+indexToInsertRecord));
  
  // Adiciona o record fazendo tratativa
  // Para update
  if(!!DEPARACAMPOID_SERVICE && DEPARACAMPOID_SERVICE != '' && requestMethodForRecord == 'PATCH'){
    var formattedRecord = recordUpdateCampaignMemberCompositePayload(record, SOBJECTTYPE);    
    formattedRecord = includeIDField(formattedRecord, record);
  }else{ // Para insert
    var formattedRecord = createSingleRecordComposite(record, SOBJECTTYPE, DEPARACAMPOS, VALORESFIXOS);
  }
  
  payloadComposite.compositeRequest[indexToInsertRecord].body.records.push( formattedRecord );
  
  return payloadComposite;
  }
  
  function includeIDField(formattedRecord, retrieveRecordFromDE){
  formattedRecord.Id = retrieveRecordFromDE[DEPARACAMPOID_SERVICE];
  return formattedRecord;
  }
  
  function updateDEResposta(payloadEnviado, payloadResposta){
    var logsToDE = [];
    var sent_DE_dados = [];
  
    var subRequestEnviado = {};
    var subRequestResposta = {};
    var errorInSend = payloadResposta[0].errorCode == null;
    for (var subRequest = 0; subRequest < payloadEnviado.compositeRequest.length; subRequest++) {
      subRequestEnviado = payloadEnviado.compositeRequest[subRequest];
      subRequestResposta = payloadResposta.compositeResponse[subRequest];
      
      for(var row = 0; row < subRequestEnviado.body.records.length; row++){
        var recordEnviado = subRequestEnviado.body.records[row];
        var recordResposta = subRequestResposta.body[row];
        
        // dados de log
        var logData = {
          IdClienteParceiro: recordEnviado.Id,
          Date: DATETIME_ENVIO,
          Envio: Platform.Function.Stringify(recordEnviado).substring(0, 2000),
          Resultado: Platform.Function.Stringify(recordResposta).substring(0, 2000)
        }
        logsToDE.push(logData);
  
        // dados para atualizar o DE que insere no Service com os Ids
        var sentDERow = {}
        sentDERow[campoPKNoDEParaAtualizar] = recordEnviado[ DEPARACAMPOS[campoPKNoDEParaAtualizar] ];
        sentDERow[flagEnvioParaService] = true; // campo de flag para guardar no DE que essa linha já foi disparada para o Service
        sent_DE_dados.push(sentDERow);
      }
  
      subRequestEnviado = {};
      subRequestResposta = {};
      recordEnviado = {};
      recordResposta = {};
    }
  
    insertBulkRecordInDE(api, logsToDE, logDECustomerKey); // Insere no DE de log
    upsertBulkRecordInDE(api, sent_DE_dados, deCustomerkey); // Insere a resposta do ID no DE de extração (OTC291 fitlrada)
  }
  
  function enviarDadosParaService(payloadComposite){
    var auth = 'Bearer ' + access_token;
  
    var req = new Script.Util.HttpRequest(urlToUpsert);
    req.emptyContentHandling = 1;
    req.retries = 2;
    req.continueOnError = true;
    req.contentType = "application/json;charset=UTF-8"
    req.setHeader("Accept", '*/*');
    req.setHeader("Accept-Encoding", 'gzip, deflate, br');
    req.setHeader("Authorization", auth);
    req.method = "POST";
  
    var stringifiedPayload = Platform.Function.Stringify(payloadComposite);
    var data = stringifiedPayload;
  
    req.postData = data;
    return req.send();
  }

</script>