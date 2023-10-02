select CP.NAME AS NOME_CLIENTE, T.id AS ID_TITULO_SF, HC_CPF_CNPJ_Titular__c AS CPF_CNPJ, T.HC_Parceiro__c as PARCEIRO, HC_Titulo__c AS TITULO, HC_Serie__c AS SERIE, HC_Plano__c AS PLANO, HC_Fim_previsto__c AS FIM_PREVISTO, HC_Cliente_x_Parceiro__c AS ID_CLIENTE_SF 
from HC_Titulo__c_SALESFORCE  T
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE CP
    ON CP.ID = T.HC_Cliente_x_Parceiro__c
where HC_renovacao_automatica__c = 'false' 
and HC_Fim_previsto__c = DATEDIFF(DD, -15, GETDATE())