SELECT
    HC_CPF_CNPJ_Titular__c AS ID,
	CASE WHEN DATEDIFF(MM, MAX(HC_Data_do_ultimo_resgate__c), GETDATE()) BETWEEN 3 AND 48 THEN 1 ELSE 0 END AS ULTIMO_RESGATE,
	CASE WHEN HC_Situacao__c = 'Finalizado - Resgate Pago' THEN 1 ELSE 0 END AS SITUACAO_RESGATE
FROM
	TB_BASE_EX_CLIENTE_COMOTC_ALGAR A
INNER JOIN HC_Titulo__c_Salesforce B
ON A.CPF_CNPJ = B.HC_CPF_CNPJ_Titular__c
GROUP BY HC_CPF_CNPJ_Titular__c,
         HC_Data_do_ultimo_resgate__c,
         HC_Situacao__c