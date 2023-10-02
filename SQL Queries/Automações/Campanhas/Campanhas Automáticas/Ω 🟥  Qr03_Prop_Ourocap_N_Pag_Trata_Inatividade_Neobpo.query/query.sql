SELECT
    A.CPF_CNPJ AS ID,
    CASE WHEN DATEDIFF(MM, MAX(HC_Data_do_ultimo_resgate__c), GETDATE()) BETWEEN 3 AND 48 
    AND q.HC_Situacao__c = 'Finalizado - Resgate Pago' THEN 1 ELSE 0 END AS Inatividade
FROM
	Tb_Base_Prop_Ourocap_N_Pag A
LEFT JOIN HC_Titulo__c_Salesforce Q ON A.CPF_CNPJ = Q.HC_CPF_CNPJ_Titular__c
GROUP BY CPF_CNPJ,
         HC_Data_do_ultimo_resgate__c,
         q.HC_Situacao__c