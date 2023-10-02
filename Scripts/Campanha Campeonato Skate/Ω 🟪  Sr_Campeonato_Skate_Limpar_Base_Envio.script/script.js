<script runat="server">
Platform("Core", "2.0");

var api = new Script.Util.WSProxy();
var dataExtensionsName = ['Tb_CampeonatoSkate_Base_Envio', 'Tb_CampeonatoSkate_Quarentena_Execucao'];

try {
  


var clearObject = [];
for (var i = 0; i < dataExtensionsName.length; i++) {
  clearObject.push({
    CustomerKey: retrieveDECustomerKeyFromName(api, dataExtensionsName[i])
  });
}

api.performBatch("DataExtension", clearObject, "ClearData");

} catch (error) {
Write('error' + '\n');
Write(Stringify(error) + '\n\n');   
}

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