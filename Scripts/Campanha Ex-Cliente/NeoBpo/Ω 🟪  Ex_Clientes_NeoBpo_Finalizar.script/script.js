<script runat=server>
Platform("Core", "2.0");
var api = new Script.Util.WSProxy();
var Id_Campanha = '7016g000002NzuZAAS'; // Id campanha
// DEs: tratada a resposta do otc291 e filtrada de envio do otc290
var dataExtensionsName = ['Tb_Base_Ex_Cliente_OTC291_Tratada_NeoBpo', 'Tb_Base_Ex_Cliente_ComOTC_Filtrada_NeoBpo'];

// ---------------------------------------------------------
// --------------------- Não modificar ---------------------
// ---------------------------------------------------------
eval(Platform.Function.TreatAsContent( Platform.Function.ContentBlockByID('51909') ));

</script>