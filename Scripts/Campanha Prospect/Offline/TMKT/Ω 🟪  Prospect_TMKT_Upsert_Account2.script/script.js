<script runat="server">
Platform("Core", "2.0");
var api = new Script.Util.WSProxy();
var urlToUpsert = 'https://brasilcap.my.salesforce.com/services/data/v52.0/composite/sobjects/Account/HC_CPF_CNPJ_Cliente__c';
var nameDE = 'Tb_Base_Prospect_OTC291_Filtrada_TMKT';
var idCampanha = '7016g000002O0CEAA0';
var attributeType = 'Account'; // Objeto para inserir
var BATCH_SIZE = 200; // 1 a 2500
// Colocar como está o nome do campo no Data Extension (de) como atributo (esquerdo) e com qual nome deve ser enviado para o Service (para)
// no lado direito como valor
var deparaCampos = {
  "CPF": "HC_CPF_CNPJ_Cliente__c",
  "Nome": "Name",
  "Dt_Nascimento_SF": "HC_Data_Nascimento__c"
}

// DE OTC291 filtrado
var campoIdNoDEParaAtualizar = 'Id_Conta';
var campoPKNoDEParaAtualizar = 'CPF';

// Formatar campos de data para formato YYYY-MM-DD
// Usar lado direito no caso do objeto deparaCampos
var dateFieldsToFormat = [
  'HC_Data_Nascimento__c'
];

// Aplicar um filtro para trazer do DE apenas linhas desejadas
var applyFilterRetrieve = true; // flag para usar o filtro "filterRetrieveRows"
// Campo para atualizar o DE informando que um contato já teve a tentativa de disparo
// Para caso o Script precise ser executado novamente
var flagEnvioParaService = 'Envio_Service_Account';
var filterRetrieveRows = {
  LeftOperand:{
    Property: flagEnvioParaService,
    SimpleOperator: 'equals',
    Value: false
  },
  LogicalOperator:"AND",
  RightOperand:{
    Property: 'Row',
    SimpleOperator: 'between',
    Value: [75000, 150000]
  }
}

eval(Platform.Function.TreatAsContent( Platform.Function.ContentBlockByID('56360') ));
</script>