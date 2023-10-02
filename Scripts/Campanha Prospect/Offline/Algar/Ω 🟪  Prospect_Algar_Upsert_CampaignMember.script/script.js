<script runat="server">
Platform("Core", "2.0");
var api = new Script.Util.WSProxy();
var nameDE = 'Tb_Base_Prospect_OTC291_Filtrada_Algar';
var idCampanha = '7016g000002NzuPAAS';

// transforma o nome de um campo para 'Id', para ser enviado ao Serivce (caso não ocorra um update, deixar o campo em branco '')
var DEPARACAMPOID_SERVICE = 'Id_Membro_Campanha';

var DEPARACAMPOS = {
  "Id_Cliente_Parceiro": "HC_Cliente_x_Parceiro__c",
  "Id_Contato": "ContactId",
  "CPF": "HC_CPF_CNPJ__c"
}

// Usar caso haja valores para inserir carimbados (que não são variáveis de acordo com a base)
var VALORESFIXOS = {
  "HC_DISPARO_CAMPANHA__c": new Date(),
  "CampaignId": idCampanha
}

// DE OTC291 filtrado
var campoIdNoDEParaAtualizar = 'Id_Membro_Campanha';
var campoPKNoDEParaAtualizar = 'CPF';

// Formatar campos de data para formato YYYY-MM-DD
// Usar lado direito no caso do objeto deparaCampos
var dateFieldsToFormat = [
  'HC_DISPARO_CAMPANHA__c'
];

// Aplicar um filtro para trazer do DE apenas linhas desejadas
var applyFilterRetrieve = true; // flag para usar o filtro "filterRetrieveRows"
// Campo para atualizar o DE informando que um contato já teve a tentativa de disparo
// Para caso o Script precise ser executado novamente
var flagEnvioParaService = 'Envio_Service_MembroCampanha';
var filterRetrieveRows = {
  LeftOperand:{
    Property: flagEnvioParaService,
    SimpleOperator: 'equals',
    Value: false
  },
  LogicalOperator:"AND",
  RightOperand:{
    Property: 'Row',
    SimpleOperator: 'lessThan', 
    Value: 75000
  }
}

eval(Platform.Function.TreatAsContent( Platform.Function.ContentBlockByID('60141') ));

</script>