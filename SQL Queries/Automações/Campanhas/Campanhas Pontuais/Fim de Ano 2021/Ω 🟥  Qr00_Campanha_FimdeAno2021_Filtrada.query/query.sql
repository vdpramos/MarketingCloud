	SELECT DISTINCT
		B.HC_CPF_CNPJ__C AS CPF_CNPJ,
		C.NAME AS NOME,
		B.HC_IDADE__C AS IDADE,
		B.HC_PARCEIRO__C AS PARCEIRO,
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
		END AS EMAIL_VALIDO,
		CASE
			WHEN B.HC_STATUS_CELULAR_1__C = 'VÁLIDO' THEN HC_CELULAR_1__C
			WHEN B.HC_STATUS_CELULAR_2__C = 'VÁLIDO' THEN HC_CELULAR_2__C
			WHEN B.HC_STATUS_CELULAR_3__C = 'VÁLIDO' THEN HC_CELULAR_3__C
			ELSE NULL
		END AS CELULAR,
		CASE
			WHEN B.HC_STATUS_CELULAR_1__C = 'VÁLIDO' THEN 1
			WHEN B.HC_STATUS_CELULAR_2__C = 'VÁLIDO' THEN 1
			WHEN B.HC_STATUS_CELULAR_3__C = 'VÁLIDO' THEN 1
			ELSE 0
		END AS CELULAR_VALIDO,
		B.HC_TIPO_DE_PESSOA__C AS TIPO_PESSOA,
		LEFT(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_TELEFONE_RESIDENCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_01,
		SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_TELEFONE_RESIDENCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_01,
		'FIXO' AS TIPO_TEL_01,
		LEFT(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_TELEFONE_COMERCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_02,
		SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_TELEFONE_COMERCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_02,
		'FIXO' AS TIPO_TEL_02,
		LEFT(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_TELEFONE_OUTRO__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_03,
		SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_TELEFONE_OUTRO__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_03,
		'FIXO' AS TIPO_TEL_03,
			LEFT(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_CELULAR_1__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_04,
		SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_CELULAR_1__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_04,
		'MÓVEL' AS TIPO_TEL_04,
		LEFT(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_CELULAR_2__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_05,
		SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_CELULAR_2__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_05,
		'MÓVEL' AS TIPO_TEL_05,
		LEFT(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_CELULAR_3__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_06,
		SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(B.HC_CELULAR_3__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_06,
		'MÓVEL' AS TIPO_TEL_06,
		B.HC_TELEFONE_PRINCIPAL__C AS TEL_PRINCIPAL,
		B.HC_CLASSIFICACAO__C AS PUBLICO_ALVO,
		A.STARTDATE AS DT_INICIO_MAILING,
		A.ENDDATE AS DT_FIM_MAILING,
		A.HC_PRODUTO__C AS ID_PRODUTO,
		A.HC_PRECO_DO_PRODUTO__C AS ID_PRODUTO_VALOR,
		B.HC_CPF_CNPJ__C AS ID,
		A.ID AS ID_CAMPANHA, 
		B.ID AS ID_CLIENTE_PARCEIRO,
		C.ID AS ID_CONTATO,
		B.HC_CLIENTE__C AS ID_CLIENTE,
        AC.HC_Data_Nascimento__c,
        C.HC_Tipo_de_Relacionamento__c
	FROM CAMPAIGN_SALESFORCE A
	INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C
	INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C
	INNER JOIN ACCOUNT_SALESFORCE AC ON AC.HC_CPF_CNPJ_Cliente__c = C.HC_CPF_CNPJ__C
	WHERE A.ID = '7016g000000744BAAQ'
	and B.HC_Classificacao__c = 'Cliente'
	and b.HC_Id_Parceiro_Cap__c = 'TCBB'
	and C.HC_Tipo_de_Relacionamento__c = 'Cliente'