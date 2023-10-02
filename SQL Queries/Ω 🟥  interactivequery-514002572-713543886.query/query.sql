SELECT DISTINCT
		rtrim(left(coalesce(CAST(B.HC_CPF_CNPJ__C as char(255)),'<null>'), 255)) as cpf_cnpj, rtrim(left(coalesce(CAST(A.HC_Mes_Inicio__c as char(255)),'<null>'), 255)) as HC_Mes_Inicio__c, rtrim(left(coalesce(CAST(A.HC_Mes_Fim__c as char(255)),'<null>'), 255)) as HC_Mes_Fim__c, rtrim(left(coalesce(CAST(A.HC_Quantidade_de_clientes_sorteados__c as char(255)),'<null>'), 255)) as HC_Quantidade_de_clientes_sorteados__c, rtrim(left(coalesce(CAST(A.HC_Valor_do_premio__c as char(255)),'<null>'), 255)) as HC_Valor_do_premio__c from CAMPAIGN_SALESFORCE A
	INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C 
	INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C
	INNER JOIN HC_TITULO__C_SALESFORCE D ON D.HC_CLIENTE_X_PARCEIRO__C = B.ID
	WHERE
	UPPER(A.[TYPE]) = 'AUTOMÁTICO'
	AND UPPER(A.HC_FORNECEDOR__C) = 'TIVIT'
	AND UPPER(A.HC_FORMATO__C) = 'SMS'
	AND A.ISACTIVE = 1
	AND A.ParentId = '7016g000000NVZQAA4'
	AND D.HC_SITUACAO__C = 'ATIVO'
	AND D.HC_Codigo_do_Parceiro_na_Origem__c IN ('TCBB')
	AND B.HC_TIPO_DE_PESSOA__C = 'PF'