<script runat="server">
Platform("Core", "2.0");
var api = new Script.Util.WSProxy();
var urlToUpsert = 'https://brasilcap.my.salesforce.com/services/data/v52.0/composite/sobjects/HC_Relacao_Cliente_Parceiro__c/Id';
var nameDE = 'ClassificacaoCalculada';
var attributeType = 'HC_Relacao_Cliente_Parceiro__c'; // Objeto para inserir
var BATCH_SIZE = 200
var deparaCampos = {
  "hc_classificacao__c": "hc_classificacao__c"
}

eval(Platform.Function.TreatAsContent( Platform.Function.ContentBlockByID('56360') ));
</script>