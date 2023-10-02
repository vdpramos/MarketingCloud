SELECT
      B.CPF AS HC_CPF_CNPJ__C, 
      '7016g000000NiyOAAS' AS CampaignId, 
      C.ID AS contactid, 
      CP.ID AS HC_Cliente_x_Parceiro__c
FROM
    Tb_Base_Prospect_OTC291_Online_Filtrada_TMKT A
INNER JOIN Tb_Base_Prospect_Online_Filtrada_TMKT B ON A.CPF = B.CPF
INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = A.CPF
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE CP ON CP.HC_CPF_CNPJ__C = A.CPF and cp.HC_Chave_Parceiro__c = 52
left join CampaignMember_SALESFORCE cm on cm.CampaignId  = '7016g000000NiyOAAS' and cm.contactid= c.id
where cm.contactid IS NULL

