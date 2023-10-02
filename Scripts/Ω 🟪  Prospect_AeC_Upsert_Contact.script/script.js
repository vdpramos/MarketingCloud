<script runat="server">
Platform("Core", "2.0");
var api = new Script.Util.WSProxy();
var urlToUpsert = 'https://brasilcap.my.salesforce.com/services/data/v52.0/composite/sobjects/Contact/HC_CPF_CNPJ_Tipo_de_Relacionamento__c';
var nameDE = 'Tb_Base_Prospect_OTC291_Online_Filtrada_AeC';
var idCampanha = '7016g000000FhMSAA0';
var attributeType = 'Contact'; // Objeto para inserir
var BATCH_SIZE = 200; // 1 a 2500
// Colocar como está o nome do campo no Data Extension (de) como atributo (esquerdo) e com qual nome deve ser enviado para o Service (para)
// no lado direito como valor
var deparaCampos = {
  "CPF": "HC_CPF_CNPJ__c",
  "Primeiro_Nome": "FirstName",
  "Sobrenome": "LastName",
  "Id_Conta": "AccountId",
  "CPF_Tipo_Relacionamento": "HC_CPF_CNPJ_Tipo_de_Relacionamento__c"
}

// Usar caso haja valores para inserir carimbados (que não são variáveis de acordo com a base)
var valoresFixos = {
  "Contato_no_Marketing__c": true,
  "HC_Tipo_de_Relacionamento__c": "Cliente"
}

// DE OTC291 filtrado
var campoIdNoDEParaAtualizar = 'Id_Contato';
var campoPKNoDEParaAtualizar = 'CPF';

// Formatar campos de data para formato YYYY-MM-DD
// Usar lado direito no caso do objeto deparaCampos
// var dateFieldsToFormat = [
// ];

// Aplicar um filtro para trazer do DE apenas linhas desejadas
var applyFilterRetrieve = true; // flag para usar o filtro "filterRetrieveRows"
// Campo para atualizar o DE informando que um contato já teve a tentativa de disparo
// Para caso o Script precise ser executado novamente
var flagEnvioParaService = 'Envio_Service_Contact';
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

eval(Platform.Function.TreatAsContent( Platform.Function.ContentBlockByID('56360') ));
</script>