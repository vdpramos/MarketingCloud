<script runat=server>
  Platform.Load("Core", "1.1.5");
  var api = new Script.Util.WSProxy();

  var BASE_OTC290_FILTRADA = "869451B9-B9E4-4638-9415-DD9592C16586"; // DE que enviou o OTC290
  var BASE_OTC291_TRATADA = "E20D726E-7172-4AFF-800F-718C08505D6D"; // DE que recebe o OTC291 tratado

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