 <script runat=server>
  Platform.Load("Core", "1.1.5");
  var api = new Script.Util.WSProxy();

  var BASE_OTC290_FILTRADA = "9ED9BC7E-1F4E-4787-A3DD-7335B38EAD00"; // DE que enviou o OTC290
  var BASE_OTC291_TRATADA = "D88208E4-1E4D-4900-B3DA-3E0EC6E60BFD"; // DE que recebe o OTC291 tratado

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