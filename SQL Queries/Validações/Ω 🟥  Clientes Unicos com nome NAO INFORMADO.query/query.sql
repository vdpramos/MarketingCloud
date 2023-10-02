SELECT  ACC.ID, t.NAME, t.hc_cpf_cnpj__c as CPF_CNPJ, t.HC_Tipo_de_Pessoa__c
FROM ACCOUNT_SALESFORCE ACC
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE T
    ON ACC.HC_CPF_CNPJ_Cliente__c = T.HC_CPF_CNPJ__c
WHERE ACC.NAME = 'NAO INFORMADO' 
    AND t.name <>  'NAO INFORMADO' and t.name not like ('NAO %')
    and t.name not like ('- %')