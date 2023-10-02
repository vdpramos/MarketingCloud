SELECT  DISTINCT B.HC_CPF_CNPJ__C AS CPF,  B.HC_Nome_Parceiro__c
FROM  HC_Titulo__c_salesforce t 
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B
    on t.HC_Cliente_x_Parceiro__c = b.id
LEFT JOIN Contact_Salesforce C 
    ON C.HC_CPF_CNPJ__c = B.HC_CPF_CNPJ__c
WHERE 
	t.HC_Meio_de_Debito__c in ('Conta Corrente', 'Conta Poupança')
	and t.HC_CANAL_RESGATE_OTC__c is null
	AND B.HC_Tipo_de_Pessoa__c = 'PF'
	and b.hc_classificacao__c = 'Ex-cliente'
	and month(t.HC_Data_do_ultimo_resgate__c) in ('01', '02') 
    and year(t.HC_Data_do_ultimo_resgate__c) = '2023'