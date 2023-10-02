<script runat=server>

var prox = new Script.Util.WSProxy();

base_otc_290 = '1178E9E5-910F-487D-81E3-4F04B2735F8F'; // DE que envia OTC290 - Close_the_loop_preparacao_OTC_filtrada
base_otc_291 = 'F7A4EDD0-8026-4C5A-8018-E9E2BB43FCC6'; // DE que recebe OTC291 - Close_the_loop_OTC291_tratada

var action = "ClearData";
var props_base_otc_290 = {
        CustomerKey: base_otc_290
};

var props_base_otc_291 = {
        CustomerKey: base_otc_291
};

var opts = {};

var data = prox.performItem("DataExtension", props_base_otc_290, action, opts);
var data = prox.performItem("DataExtension", props_base_otc_291, action, opts);

</script>