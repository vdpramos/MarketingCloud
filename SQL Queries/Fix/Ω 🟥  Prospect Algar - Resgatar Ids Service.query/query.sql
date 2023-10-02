select
  a.CPF,
  case when b.id is not null then b.id else null end as Id_Conta,
  case when b.id is not null then 1 else 0 end as Envio_Service_Account,
  case when c.id is not null then c.id else null end as Id_Contato,
  case when c.id is not null then 1 else 0 end as Envio_Service_Contact,
  case when d.id is not null then d.id else null end as Id_Cliente_Parceiro,
  case when d.id is not null then 1 else 0 end as Envio_Service_ClienteParceiro
from Tb_Base_Prospect_OTC291_Filtrada_Algar a 
left join Account_Salesforce b on a.CPF = b.HC_CPF_CNPJ_Cliente__c
left join Contact_Salesforce c on a.CPF_Tipo_Relacionamento = c.HC_CPF_CNPJ_Tipo_de_Relacionamento__c
left join HC_Relacao_Cliente_Parceiro__c_Salesforce d on a.CPF_Codigo_Parceiro_Unico = d.HC_CPF_CNPJ_Codigo_Parceiro_Unico__c
where 
  b.id is not null
  or c.id is not null
  or d.id is not null