SELECT
    A.CPF_CNPJ AS ID,
    case when q.LastModifiedDate between dateadd(m,-48,getdate()) and dateadd(m,-3,getdate()) then 0 else 1
    end as Inatividade
FROM
	TB_BASE_EX_CLIENTE_COMOTC_ALGAR A
LEFT JOIN HC_Titulo__c_Salesforce Q ON A.CPF_CNPJ = Q.ID