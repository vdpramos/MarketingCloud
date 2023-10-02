<script runat=server>
  Platform.Load("Core", "1.1.5");
  var api = new Script.Util.WSProxy();
  var dataExtensionsName = [
    'Tb_Base_Prospect_OTC291_Online_Tratada_NeoBpo_Pub2',
    'TB_BASE_PROSPECT_COMOTC_ONLINE_FILTRADA_NEOBPO_PUB2'
  ];

  try{
    var dataExtensionsCustomerKeysToClear = retrieveDEsCustomerKeyByName(dataExtensionsName);
    var clearObject = [];
    for (var i = 0; i < dataExtensionsCustomerKeysToClear.length; i++) {
      clearObject.push({
        CustomerKey: dataExtensionsCustomerKeysToClear[i].CustomerKey
      });
    }
    var res = api.performBatch("DataExtension", clearObject, "ClearData");
  
  }catch(error){
    Platform.Function.RaiseError('Something went wrong');
  }
  
  function retrieveDEsCustomerKeyByName(DEname){
    var filter = {
      Property: "Name",
      Value: DEname
    };
    
    if( isArray(DEname) && DEname.length > 1 ){
      filter.SimpleOperator = "IN";
    }
    else if(isArray(DEname) && DEname.length == 1){
      filter.SimpleOperator = "equals";
      filter.Value = DEname[0];
    }else{
      filter.SimpleOperator = "equals";
      filter.Value = DEname;
    }
    
    var req = api.retrieve("DataExtension", ["Name", "CustomerKey"], filter);
    return req.Results;
  }
  
  function isArray(a) {
    return (!!a) && Object.prototype.toString.call(a) == '[object Array]'
  };

</script>