SELECT 
    a.Id_contato,
    a.Nome,
    b.Id as Id_cliente_parceiro,
    b.HC_CPF_CNPJ__c AS CPF_CNPJ,
    REPLACE(REPLACE(REPLACE(REPLACE(b.HC_Celular_1__c, '(', ''), ')', ''), ' ', ''), '-', '') AS Celular_1,
    REPLACE(REPLACE(REPLACE(REPLACE(b.HC_Celular_2__c, '(', ''), ')', ''), ' ', ''), '-', '') AS Celular_2,
    REPLACE(REPLACE(REPLACE(REPLACE(b.HC_Celular_3__c, '(', ''), ')', ''), ' ', ''), '-', '') AS Celular_3,
    REPLACE(REPLACE(REPLACE(REPLACE(b.HC_Telefone_Outro__c, '(', ''), ')', ''), ' ', ''), '-', '') AS Telefone_Brasilcap,
    REPLACE(REPLACE(REPLACE(REPLACE(b.HC_Telefone_Comercial__c, '(', ''), ')', ''), ' ', ''), '-', '') AS Telefone_comercial,
    CASE 
    	WHEN b.HC_Email_Brasilcap__c IS NOT NULL THEN b.HC_Email_Brasilcap__c
    	WHEN b.HC_Email_Pessoal__c IS NOT NULL THEN b.HC_Email_Pessoal__c
    	WHEN b.HC_Email_Comercial__c IS NOT NULL THEN b.HC_Email_Comercial__c
    	ELSE NULL
    END AS Email,
    CASE 
    	WHEN UPPER(b.HC_Endereco_Principal__c) = 'RESIDENCIAL' THEN b.HC_UF_Res__c
    	WHEN UPPER(b.HC_Endereco_Principal__c) = 'COMERCIAL' THEN b.HC_UF_Com__c
    	WHEN UPPER(b.HC_Endereco_Principal__c) = 'CORRESPONDÊNCIA' THEN b.HC_UF_Cor__c
    END AS UF,
    b.HC_Idade__c AS Idade,
    b.HC_Data_de_Nascimento__c AS Data_nascimento,
    c.Id AS Id_titulo,
    c.HC_Tipo_de_pagamento__c AS Tipo_pagamento,
    c.HC_Inicio__c AS Inicio
FROM Close_the_loop_clientes_ativos a
    INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce b
        ON a.Id_cliente = b.HC_Cliente__c
    INNER JOIN HC_Titulo__c_Salesforce c
        ON b.Id = c.hc_subscritor__c
WHERE
    b.HC_Tipo_de_Pessoa__c = 'PF'
    AND
    b.HC_Nao_deseja_receber_Ligacoes__c = 'False'
    AND
    b.HC_Nao_deseja_receber_Todos_Meios__c = 'False'
    AND
    (
        b.HC_Id_Parceiro_Cap__c = 'TCBB'
        OR
        b.HC_Id_Parceiro_Darwin__c = '1'
    )
    AND
    c.HC_Tipo_de_pagamento__c IN ('PM', 'PP')
    AND
    c.HC_Inicio__c BETWEEN DATEADD(DD, 21, EOMONTH(GETDATE(),-3)) AND DATEADD(DD, 20, EOMONTH(GETDATE(),-2))