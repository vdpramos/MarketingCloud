<script runat="server">
  Platform("Core", "2.0");

  var api = new Script.Util.WSProxy();
  var dataExtensionsName = [
  'Tb_Base_Prospect_ComOTC_Filtrada_TMKT',
  'Tb_Base_Prospect_OTC291_Tratada_TMKT',
  'Flag_Extracao_Prospect_TMKT',
  'Flag_Integracao_Prospect_TMKT']; // DE que enviou o OTC290


  var clearObject = [];
  for (var i = 0; i < dataExtensionsName.length; i++) {
    clearObject.push({
      CustomerKey: retrieveDECustomerKeyFromName(api, dataExtensionsName[i])
    });
  }
  
  api.performBatch("DataExtension", clearObject, "ClearData");
  
  /* aux functions */
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
