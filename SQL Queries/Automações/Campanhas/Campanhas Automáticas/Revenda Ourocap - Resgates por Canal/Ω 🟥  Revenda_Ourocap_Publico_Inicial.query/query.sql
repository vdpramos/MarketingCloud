SELECT DISTINCT
	B.HC_CPF_CNPJ__C AS CPF_CNPJ,
	replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (C.NAME, 'á', 'a'),'é', 'e'),'í', 'i'),'ó', 'o'),'ú', 'u'),'Á', 'A'),'É', 'E'),'Í', 'I'),'Ó', 'O'),'Ú', 'U'),'à', 'a'),'À', 'A'),'ã', 'a'),'õ', 'o'),'Ã', 'A'),  'Õ', 'O'),'â', 'a'),'ê', 'e'),'ô', 'o'),'Â', 'A'),'Ê', 'E'),'Ô', 'O'),'ç', 'c'),'Ç', 'c') as NOME,
	/*C.NAME AS NOME,*/
	B.HC_IDADE__C AS IDADE,
	B.HC_DATA_DE_NASCIMENTO__C AS DT_NASCIMENTO,
	B.HC_GENERO_DO_CLIENTE__C AS SEXO,
	B.HC_PARCEIRO__C AS PARCEIRO,
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
	ROW_NUMBER() OVER(ORDER BY B.ID ASC) AS ROWNO,
	CASE WHEN DATEPART(WEEKDAY, GetDate()) = 6 THEN DATEADD(DAY, 3, DATEADD(HH, 3, A.HC_DATA_DE_EXECUCAO__C)) ELSE DATEADD(DAY, A.HC_PROXIMA_EXECUCAO__C, DATEADD(HH, 3, A.HC_DATA_DE_EXECUCAO__C)) END AS DATA_PROXIMA_EXECUCAO
FROM CAMPAIGN_SALESFORCE A
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B 
    ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C
	AND A.HC_TIPO_DE_CLIENTE__C = B.HC_TIPO_DE_PESSOA__C
INNER JOIN CONTACT_SALESFORCE C 
    ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C
INNER JOIN HC_TITULO__C_SALESFORCE D 
    ON D.HC_CLIENTE_X_PARCEIRO__C = B.ID
LEFT JOIN HC_PROPOSTA__C_SALESFORCE P 
    ON P.HC_CPF_CNPJ_TITULAR__C = B.HC_CPF_CNPJ__C 
    AND DATEDIFF(DAY, CONVERT(CHAR(10), P.CREATEDDATE, 112), CONVERT(CHAR(10), GETDATE(), 112)) <= A.HC_COMPRA_RECENTE__C 
WHERE
    A.PARENTID = '7016g000000FjOlAAK' /*Revenda TMKT*/
    AND D.HC_SITUACAO__C IN ('Finalizado - Resgate Pago', 'Baixado por solicitação', 'Finalizado - Antecipado total')
    AND convert(int,D.HC_CANAL_RESGATE_OTC__c) = A.HC_CANAL_RESGATE__c
    AND	D.HC_DATA_DO_ULTIMO_RESGATE__C >= GETDATE()-5
    AND B.HC_Nao_deseja_receber_Todos_Meios__c = 'false'
    AND B.HC_DATA_DE_NASCIMENTO__C IS NOT NULL
