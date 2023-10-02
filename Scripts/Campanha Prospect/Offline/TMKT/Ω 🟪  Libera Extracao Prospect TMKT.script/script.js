<script runat="server">

  Platform("Core", "2.0");
  var api = new Script.Util.WSProxy();
  var DEFiltrada = 'Tb_Base_Prospect_OTC291_Filtrada_TMKT';
  var DEName = 'Flag_Extracao_Prospect_TMKT';
  var myFilter = {
      Property: 'Envio_Service_MembroCampanha',
      SimpleOperator: 'equals',
      Value: false
  }
  
  var recordOperator = DataExtensionRecordsOperator({api:api, dataExtensionName: DEFiltrada})
  var records = recordOperator.getRecords({filter: myFilter});

  if(records.length == 0){
    // se não houver records para enviar de membro da campanha, então finalizou
    insertRecordInDE(api, {EXTRACAO: true}, retrieveDECustomerKeyFromName(api, DEName));
  }
  // create record to allow integration to continue
    
  // aux functions
  function insertRecordInDE(api, record, customerKey){
    if(!api) Platform.Function.RaiseError('Api param is required');
    var props = [];
    for(prop in record){
      props.push( {Name: prop, Value: record[prop] } );
    }
    var data = {
      CustomerKey: customerKey,
      Properties: props
    }
    return api.createItem('DataExtensionObject', data);
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
</script>