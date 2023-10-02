select
  ID_TITULO,
  CPF_CNPJ,
  prd.Name as Nome_Produto
from Tb_Boas_Vindas_3_Meses_Caracteristicas_Titulos
inner join HC_Titulo__c_Salesforce tit on tit.Id = ID_TITULO
inner join HC_Produto__c_Salesforce prd on tit.HC_produtoRelacionado__c = prd.Id