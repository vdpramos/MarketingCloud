<script runat="server">
  Platform("Core", "2.0");
  var api = new Script.Util.WSProxy();
  var DEName = 'Flag_Integracao_Prospect_TMKT';
  
  // create record to allow integration to continue
  insertRecordInDE(api, {INTEGRACAO: true}, retrieveDECustomerKeyFromName(api, DEName));
    
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
</script>