<script runat=server>
  Platform.Load("Core", "1.1.5");
  var api = new Script.Util.WSProxy();

  var BASE_OTC290_FILTRADA = "4C6B92F3-5838-4AE1-BDF9-9866FF8D8D8A"; // DE que enviou o OTC290
  var BASE_OTC291_TRATADA = "8A9CC35B-CA82-4D13-A9FF-E80893D53B20"; // DE que recebe o OTC291 tratado

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