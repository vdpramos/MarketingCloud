<script runat=server>
  Platform.Load("Core", "1.1.5");
  var api = new Script.Util.WSProxy();

  var BASE_OTC290_FILTRADA = "F74BED9E-146C-443C-8FA7-BF7046425445"; // DE que enviou o OTC290
  var BASE_OTC291_TRATADA = "8FB2F699-8B86-4519-BE9F-337E31BEFA8E"; // DE que recebe o OTC291 tratado

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