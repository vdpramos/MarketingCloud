<script runat="server">
// Confere se deve continuar produzindo publico pro OTC290
Platform("Core", "2.0");
var Id_Campanha = '7016g000002O089AAC'; // Campanha Online Cliente - Neobpo - Detalhe
var DE_flag_name = 'Flag_Publico_Inicial_Cliente_NeoBpo'; // Flag_Publico_Inicial_Cliente_NeoBpo

// ---------------------------------------------------------
// --------------------- Não modificar ---------------------
// ---------------------------------------------------------
try{

  var api = new Script.Util.WSProxy();
  var DE_flag = retrieveDECustomerKeyFromName(api, DE_flag_name);
  var DE_Controller_Name = 'CONTROLE_AUTOMACOES_CAMPANHAS';
  var DE_Controller = retrieveDECustomerKeyFromName(api, DE_Controller_Name);
  var DE_campanha_Controller_Operator = DataExtensionRecordsOperator({api: api, dataExtensionName: DE_Controller_Name});

  var filter = {
    Property: "ID_CAMPANHA",
    SimpleOperator: "equals",
    Value: Id_Campanha
  }

  var recordsCampanha = DE_campanha_Controller_Operator.getRecords({filter: filter,
     headers: ['ID_CAMPANHA', 'STATUS_AUTOMACAO']});

  if(recordsCampanha == null || recordsCampanha.length == 0){
    Platform.Function.RaiseError('Campanha não encontrada');
  }

  if(recordsCampanha[0].STATUS_AUTOMACAO != 'PREPARANDO OTC290'){
    // Campanha cliente não executada por estar em outro estado
    // limpa DE de flag para impedir execução na automação
    api.performItem("DataExtension", { CustomerKey: DE_flag }, "ClearData");

  }else{
    // Adiciona linha no DE flag para continuar
    var props = [
      {
        Name: 'Continue',
        Value: 'true'
      }
    ];
    var data = {
      CustomerKey: DE_flag,
      Properties: props
    }
    var result = api.createItem('DataExtensionObject', data);
  }
  
} catch (error) {
  // Write('error\n');
  // Write(Stringify(error.message));
  var props = [
    {
      Name: 'STATUS_AUTOMACAO',
      Value: 'ERROR: SCRIPT GERACAO PUBLICO INICIAL'
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