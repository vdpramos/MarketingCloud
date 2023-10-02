<script runat=server>
  Platform.Load("Core", "1.1.5");
  var api = new Script.Util.WSProxy();

  var BASE_OTC290_FILTRADA = "090DE52D-4228-47E4-B3E8-1BEDBD399196"; // DE que enviou o OTC290
  var BASE_OTC291_TRATADA = "2900644E-8D46-4059-BB29-39AAA5297619"; // DE que recebe o OTC291 tratado

  var action = "ClearData";
  var opts = {};
  var props_BASE_OTC290_FILTRADA = {
    CustomerKey: BASE_OTC290_FILTRADA
  };

  var props_BASE_OTC291_TRATADA = {
    CustomerKey: BASE_OTC291_TRATADA
  };
  
  api.performItem("DataExtension", props_BASE_OTC290_FILTRADA, action, opts);
  api.performItem("DataExtension", props_BASE_OTC291_TRATADA, action, opts);

</script>