<script runat=server>

var prox = new Script.Util.WSProxy();

base_otc_291 = 'A83E11E8-F4A7-43FC-A54F-17C471238BDD'; // DE que recebe OTC291 - Informe_Rendimentos_OTC291_tratada

var action = "ClearData";

var props_base_otc_291 = {
        CustomerKey: base_otc_291
};

var opts = {};

var data = prox.performItem("DataExtension", props_base_otc_291, action, opts);

</script>