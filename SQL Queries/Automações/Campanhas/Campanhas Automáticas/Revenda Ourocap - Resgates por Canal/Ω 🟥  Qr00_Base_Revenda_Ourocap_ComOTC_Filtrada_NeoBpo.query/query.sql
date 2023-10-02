SELECT DISTINCT
    B.HC_CPF_CNPJ__C AS CPF_CNPJ,
	C.NAME AS NOME,
	B.HC_IDADE__C AS IDADE,
	B.HC_DATA_DE_NASCIMENTO__C AS DT_NASCIMENTO,
	B.HC_GENERO_DO_CLIENTE__C AS SEXO,
	B.HC_PARCEIRO__C AS PARCEIRO,
	/*CASE 
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'RESIDENCIAL' THEN HC_ENDERECO_RESIDENCIAL__C
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'COMERCIAL' THEN HC_ENDERECO_COMERCIAL__C
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'CORRESPONDÊNCIA' THEN HC_ENDERECO_CORRESPONDENCIA__C
	END AS ENDERECO,*/
	CASE 
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'RESIDENCIAL' THEN HC_UF_RES__C
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'COMERCIAL' THEN HC_UF_COM__C
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'CORRESPONDÊNCIA' THEN HC_UF_COR__C
	END AS UF,
	CASE 
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'RESIDENCIAL' THEN HC_CEP_RES__C
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'COMERCIAL' THEN HC_CEP_COM__C
		WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'CORRESPONDÊNCIA' THEN HC_CEP_COR__C
	END AS CEP,
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
	A.[TYPE] AS TIPO_CAMPANHA,
	A.STARTDATE AS DT_INICIO_MAILING,
	A.ENDDATE AS DT_FIM_MAILING,
	A.HC_VALIDA_ALTA_RENDA__C AS CAMPANHA_VALIDA_ENCARTEIRAMENTO,
    A.HC_VALIDA_NAO_IMPORTUNE__C AS CAMPANHA_NAO_IMPORTUNE,
    A.HC_VALIDA_RNA__C AS CAMPANHA_VALIDA_RNA,
	A.HC_PRODUTO__C AS ID_PRODUTO,
    A.HC_PRECO_DO_PRODUTO__C AS ID_PRODUTO_VALOR,
	B.HC_CPF_CNPJ__C AS ID,
	A.ID AS ID_CAMPANHA, 
	B.ID AS ID_CLIENTE_PARCEIRO,
	C.ID AS ID_CONTATO,
	B.HC_CLIENTE__C AS ID_CLIENTE,
	B.HC_CPF_CNPJ_CODIGO_DO_PARCEIRO__C AS CPF_CNPJ_CODIGO_DO_PARCEIRO,
	D.HC_DATA_DO_ULTIMO_RESGATE__C AS DT_ULTIMO_RESGATE,
	D.HC_CANAL_RESGATE_OTC__c AS CANAL_ULTIMO_RESGATE,
	D.HC_SITUACAO__C AS TIPO_RESGATE,
	D.HC_VALOR_DA_PARCELA__C AS VALOR_PARCELA_PRODUTO,
	A.HC_EXCLUSAO_DE_COMPRA_RECENTE__C AS MESES_COMPRA_EXCLUSAO,
	A.HC_QUARENTENA__C AS MESES_QUARENTENA_EXCLUSAO,
	DATEADD(DAY, A.HC_PROXIMA_EXECUCAO__C,A.HC_DATA_DE_EXECUCAO__C) AS DATA_PROXIMA_EXECUCAO
FROM CAMPAIGN_SALESFORCE A
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C
                                                      AND A.HC_TIPO_DE_CLIENTE__C = B.HC_TIPO_DE_PESSOA__C
INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C
INNER JOIN HC_TITULO__C_SALESFORCE D ON D.HC_CLIENTE_X_PARCEIRO__C = B.ID
WHERE
    UPPER(A.[TYPE]) = 'AUTOMÁTICO'
/*AND UPPER(B.HC_CLASSIFICACAO__C) = 'CLIENTE' CLIENTE SOLICITOU QUE O PARAMETRO OFSSE RETIRADO*/
AND B.HC_TIPO_DE_PESSOA__C = 'PF'
AND UPPER(A.HC_FORNECEDOR__C) = 'TIVIT'
AND UPPER(A.HC_FORMATO__C) = 'ONLINE'
AND A.HC_VALIDA_RNA__C = 1
AND A.PARENTID IS NOT NULL
AND CONVERT(VARCHAR, A.HC_DATA_DE_EXECUCAO__C, 112) = CONVERT(VARCHAR, GETDATE(), 112)
AND A.ISACTIVE = 1
/*AND A.HC_CAMPANHA_EXECUTADA_NO_MKT__C = 0*/
AND D.HC_DATA_DO_ULTIMO_RESGATE__C BETWEEN A.HC_DATA_INICIAL_DO_PERIODO_DE_RESGATE__C AND A.HC_DATA_FIM_DO_PERIODO_DE_RESGATE__C
AND D.HC_VALOR_DA_PARCELA__C BETWEEN A.HC_VALOR_MINIMO_DE_PARCELA__C AND A.HC_VALOR_MAXIMO_DA_PARCELA__C
AND D.HC_SITUACAO__C IN ('Finalizado - Resgate Pago', 'Baixado por solicitação', 'Finalizado - Antecipado total')
AND D.HC_CANAL_RESGATE_OTC__c IN ('010', '040', '045', '055')