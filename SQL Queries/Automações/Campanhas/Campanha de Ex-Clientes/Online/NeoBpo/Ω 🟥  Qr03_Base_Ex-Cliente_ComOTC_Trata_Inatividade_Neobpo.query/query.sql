SELECT
    A.ID AS ID,
    CASE WHEN DATEDIFF(MM, MAX(HC_Data_do_ultimo_resgate__c), GETDATE()) BETWEEN 3 AND 48 
    AND HC_Situacao__c = 'Finalizado - Resgate Pago' THEN 1 ELSE 0 END AS Inatividade
FROM
	TB_BASE_EX_CLIENTE_COMOTC_NEOBPO A
LEFT JOIN HC_Titulo__c_Salesforce Q ON A.CPF_CNPJ = Q.HC_CPF_CNPJ_Titular__c
GROUP BY A.ID,
         HC_Data_do_ultimo_resgate__c,
         HC_Situacao__c