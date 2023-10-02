SELECT distinct c.ID, CONCAT(c.HC_CPF_CNPJ__c, c.HC_Id_Parceiro_Cap__c) AS CPF_CNPJ_PARCEIRO , c.HC_Id_Parceiro_Cap__c AS PARCEIRO, c.HC_CPF_CNPJ__c AS CPF_CNPJ
FROM HC_Relacao_Cliente_Parceiro__c_salesforce c
left join hc_titulo__c_SALESFORCE t
    on t.HC_Cliente_x_Parceiro__c = c.id
WHERE c.HC_Classificacao__c <> 'Cliente Potencial' 
      AND c.HC_Origem__c = 'CAP' 
      and (t.HC_Origem__c = 'CAP' or t.HC_Origem__c is null) 