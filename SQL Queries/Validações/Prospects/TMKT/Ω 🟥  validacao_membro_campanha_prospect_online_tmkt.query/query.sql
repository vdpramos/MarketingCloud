select
a.CPF,
c.Id as Id_Contato,
CM.CreatedDate as Data_criacao_membro
from
Tb_Base_Prospect_OTC291_Online_Filtrada_TMKT a
INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = A.CPF
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE CP ON CP.HC_CPF_CNPJ__C = A.CPF  AND CP.HC_Chave_Parceiro__c = '52'
INNER JOIN CampaignMember_SALESFORCE CM ON CM.CONTACTID = C.ID AND CM.CampaignId = '7016g000000NiyOAAS'
left join Tb_Base_Prospect_Extracao_Online_TMKT ext on a.CPF = ext.CPF_CNPJ
where
ext.CPF_CNPJ is null