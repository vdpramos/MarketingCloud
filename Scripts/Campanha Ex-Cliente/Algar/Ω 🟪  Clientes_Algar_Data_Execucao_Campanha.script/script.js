<script runat="server">
// Checa se está no momento de executar a campanha (datetime)
Platform("Core", "2.0");
var Id_Campanha = '7016g000000NSIuAAO'; // Id campanha

// ---------------------------------------------------------
// --------------------- Não modificar ---------------------
// ---------------------------------------------------------
try{
  var api = new Script.Util.WSProxy();
  var DE_campanha = 'Campaign_Salesforce'; // Customer key DE Campanhas no Salesforce
  var DE_Controller_Name = 'CONTROLE_AUTOMACOES_CAMPANHAS';
  var DE_Controller = retrieveDECustomerKeyFromName(api, DE_Controller_Name) // DE para inserir: "CONTROLE_AUTOMACOES_CAMPANHAS"
  var DE_campanha_Operator = DataExtensionRecordsOperator({api: api, dataExtensionName: DE_campanha});

  var filter = {
    Property: "Id",
    SimpleOperator: "equals",
    Value: Id_Campanha
  }

  var recordsCampanha = DE_campanha_Operator.getRecords({filter: filter,
     headers: ['Id', 'Name', 'HC_Quantidade_de_contatos_no_Mailing__c', 'HC_Data_de_Execucao__c']});

  if(recordsCampanha == null || recordsCampanha.length == 0){
    Platform.Function.RaiseError('Campanha não encontrada');
  }

  // data de execução da campanha
  var executionDate = new Date(recordsCampanha[0].HC_Data_de_Execucao__c);
  var now = new Date();

  if(recordsCampanha[0].HC_Quantidade_de_contatos_no_Mailing__c == null || recordsCampanha[0].HC_Quantidade_de_contatos_no_Mailing__c == undefined
    || recordsCampanha[0].HC_Quantidade_de_contatos_no_Mailing__c == ''){
      Platform.Function.RaiseError('Quantidade desejada no OTC290 inválida');
  }
  var quantidadeDesejadaOTC290 = recordsCampanha[0].HC_Quantidade_de_contatos_no_Mailing__c;

  if( executionDate.getDay() == now.getDay() && executionDate.getMonth() == now.getMonth() && executionDate.getFullYear() == now.getFullYear()
    && executionDate.getHours() == now.getHours() ){
    
    //Insere o record

    // Preparar record para inserir
    var props = [
      {
        Name: 'ID_CAMPANHA',
        Value: recordsCampanha[0].Id
      },
      {
        Name: 'NOME',
        Value: recordsCampanha[0].Name
      },
      {
        Name: 'STATUS_AUTOMACAO',
        Value: 'PREPARANDO OTC290'
      },
      {
        Name: 'QUANTIDADE_DESEJADA_OTC290',
        Value: parseInt(quantidadeDesejadaOTC290)
      }
    ];
    
    var recordToUpsert = {
      CustomerKey: DE_Controller,
      Properties: props
    }

    // Write('recordToUpsert' + '\n');
    // Write(Stringify(recordToUpsert) + '\n\n');
    
    var options = {SaveOptions: [{'PropertyName': '*', SaveAction: 'UpdateAdd'}]};
    var resultado = api.updateItem('DataExtensionObject', recordToUpsert, options);
    
    // Write('resultado' + '\n');
    // Write(Stringify(resultado) + '\n\n');

  }//else{
    //Write('Não criado' + '\n');
  // }
  
} catch (error) {
  // Write('error\n');
  // Write(Stringify(error.message));
  var props = [
    {
      Name: 'STATUS_AUTOMACAO',
      Value: 'ERROR: SCRIPT DATA DE EXECUCAO'
    }
  ];
  var data = {
    CustomerKey: DE_Controller,
    Properties: props
  }
  var result = api.createItem('DataExtensionObject', data);
  Platform.Function.RaiseError('Something went wrong');
}

// ---------------- Library ----------------
// Aux to use Array.map
function mapArray(array, callback, thisArg) {
  var T, A, k;var O = array;var len = O.length;if (typeof callback !== 'function') {throw new TypeError(callback + ' is not a function');}if (arguments.length > 2) {T = thisArg;}A = [];k = 0;while (k < len) {var kValue, mappedValue;kValue = O[k];mappedValue = callback.call(T, O[k], k, O);A.push(mappedValue);k++;}return A;
}

// Auxiliar para resgatar dados do Data Extension
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
    getRecords: getRecords
  }
}

function retrieveDECustomerKeyFromName(api, dataExtensionName){
  var simpleFilter = {
    Property: 'Name',
    SimpleOperator: 'equals',
    Value: dataExtensionName
  }
  var result = api.retrieve("DataExtension", ["CustomerKey"], simpleFilter);
  if(result.Status != 'OK' || result.Results.length < 1){
    return null
  }else{
    return result.Results[0].CustomerKey;
  }
}

</script>