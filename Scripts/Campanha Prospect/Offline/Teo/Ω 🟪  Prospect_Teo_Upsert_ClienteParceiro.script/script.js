<script runat="server">
Platform("Core", "2.0");
var api = new Script.Util.WSProxy();
var urlToUpsert = 'https://brasilcap.my.salesforce.com/services/data/v52.0/composite/sobjects/HC_Relacao_Cliente_Parceiro__c/HC_CPF_CNPJ_Codigo_Parceiro_Unico__c';
var nameDE = 'Tb_Base_Prospect_OTC291_Filtrada_Teo';
var idCampanha = '7016g000002O0CIAA0';
var attributeType = 'HC_Relacao_Cliente_Parceiro__c'; // Objeto para inserir
var BATCH_SIZE = 200; // 1 a 2500
// Colocar como está o nome do campo no Data Extension (de) como atributo (esquerdo) e com qual nome deve ser enviado para o Service (para)
// no lado direito como valor
var deparaCampos = {
  "Id_Conta": "HC_Cliente__c",
  "CPF": "HC_CPF_CNPJ__c",
  "Nome": "Name",
  "Codigo_RNA": "HC_RNA__c",
  "Faixa_Renda_Mensal": "HC_Faixa_de_Renda_Mensal__c",
  "CPF_Codigo_Parceiro_Unico": "HC_CPF_CNPJ_Codigo_Parceiro_Unico__c",
  "CPF_Codigo_Parceiro": "HC_CPF_CNPJ_Codigo_do_Parceiro__c",
  "Tel_Residencial": "HC_Telefone_Outro__c"
}

// Usar caso haja valores para inserir carimbados (que não são variáveis de acordo com a base)
var valoresFixos = {
  "HC_Parceiro__c": "a0W6g000006R0MfEAK", 
  "HC_Tipo_de_Pessoa__c": "PF", 
  "HC_Classificacao__c": "Cliente Potencial", 
  "HC_Telefone_Principal__c": "Telefone Outro", 
  "HC_Origem__c": "CAP", 
  "HC_Id_Parceiro_Cap__c": "TCBB" 
}

// DE OTC291 filtrado
var campoIdNoDEParaAtualizar = 'Id_Cliente_Parceiro';
var campoPKNoDEParaAtualizar = 'CPF';

// Formatar campos de data para formato YYYY-MM-DD
// Usar lado direito no caso do objeto deparaCampos
// var dateFieldsToFormat = [
// ];

// Aplicar um filtro para trazer do DE apenas linhas desejadas
var applyFilterRetrieve = true; // flag para usar o filtro "filterRetrieveRows"
// Campo para atualizar o DE informando que um contato já teve a tentativa de disparo
// Para caso o Script precise ser executado novamente
var flagEnvioParaService = 'Envio_Service_ClienteParceiro';
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