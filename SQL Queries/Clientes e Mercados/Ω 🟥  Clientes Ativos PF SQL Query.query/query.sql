SELECT
	HC_CPF_CNPJ_Subscritor__c AS CPF,
	HC_Tipo_de_pagamento__c AS FormaPagamento
FROM
    HC_Titulo__c_Salesforce
WHERE
    HC_Familia_do_produto_do_titulo__c = 'Ourocap'
AND HC_Situacao__c in ('Ativo', 'Em processo de finalização', 'Em processo de Reativação', 'Suspenso')
AND LEN(HC_CPF_CNPJ_Subscritor__c) = 11