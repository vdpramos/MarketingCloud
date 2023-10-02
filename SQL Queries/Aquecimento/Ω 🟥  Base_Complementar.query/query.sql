
	SELECT DISTINCT
		B.HC_CPF_CNPJ__C AS CPF,
		C.NAME AS NOME,
		CASE
			WHEN B.HC_EMAIL_PRINCIPAL__C = 'Brasilcap' THEN HC_EMAIL_BRASILCAP__C
			WHEN B.HC_EMAIL_PRINCIPAL__C = 'Comercial' THEN HC_EMAIL_COMERCIAL__C
			WHEN B.HC_EMAIL_PRINCIPAL__C = 'Pessoal' THEN HC_EMAIL_PESSOAL__C
			WHEN B.HC_EMAIL_BRASILCAP__C IS NOT NULL THEN HC_EMAIL_BRASILCAP__C
			WHEN B.HC_EMAIL_COMERCIAL__C IS NOT NULL THEN HC_EMAIL_COMERCIAL__C
			WHEN B.HC_EMAIL_PESSOAL__C IS NOT NULL THEN HC_EMAIL_PESSOAL__C
			ELSE NULL
		END AS EMAIL,
		CASE
			WHEN B.HC_EMAIL_PRINCIPAL__C IN ('Brasilcap', 'Comercial', 'Pessoal') THEN 1
			WHEN B.HC_EMAIL_BRASILCAP__C IS NOT NULL THEN 1
			WHEN B.HC_EMAIL_COMERCIAL__C IS NOT NULL THEN 1
			WHEN B.HC_EMAIL_PESSOAL__C IS NOT NULL THEN 1
			ELSE 0
		END AS EMAIL_VALIDO
		
	
FROM CAMPAIGN_SALESFORCE A
	INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C AND A.HC_TIPO_DE_CLIENTE__C = B.HC_TIPO_DE_PESSOA__C
	INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C
	INNER JOIN HC_TITULO__C_SALESFORCE D ON D.HC_CLIENTE_X_PARCEIRO__C = B.ID
	WHERE
	UPPER(A.[TYPE]) = 'AUTOMÁTICO'
	AND UPPER(A.HC_FORNECEDOR__C) = 'TIVIT'
	AND UPPER(A.HC_FORMATO__C) = 'SMS'
	AND A.ISACTIVE = 1
	AND A.ParentId = '7016g000000NVZQAA4'
	AND B.HC_TIPO_DE_PESSOA__C = 'PF'
	AND D.HC_SITUACAO__C = 'ATIVO'
	AND D.HC_Codigo_do_Parceiro_na_Origem__c IN ('TCBB')



