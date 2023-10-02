select
  ID_TITULO,
  CPF_CNPJ,
  prd.Name as Nome_Produto
from TB_BOAS_VINDAS_OUROCACAP_CARACTERISTICAS_TITULOS
inner join HC_Titulo__c_Salesforce tit on tit.Id = ID_TITULO
inner join HC_Produto__c_Salesforce prd on tit.HC_produtoRelacionado__c = prd.Id