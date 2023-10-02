SELECT
	A.*
FROM (
		SELECT
		  B.HC_CPF_CNPJ__C AS CPF_CNPJ,
		  C.NAME AS NOME,
		  HC_IDADE__C AS IDADE,
		  HC_DATA_DE_NASCIMENTO__C AS DT_NASCIMENTO,
		  HC_GENERO_DO_CLIENTE__C AS SEXO,
		  B.HC_PARCEIRO__C AS PARCEIRO,
		  CASE 
				WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'RESIDENCIAL' THEN HC_CEP_RES__C
				WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'COMERCIAL' THEN HC_CEP_COM__C
				WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'CORRESPONDÊNCIA' THEN HC_CEP_COR__C
			END AS CEP,
			CASE 
				WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'RESIDENCIAL' THEN HC_UF_RES__C
				WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'COMERCIAL' THEN HC_UF_COM__C
				WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'CORRESPONDÊNCIA' THEN HC_UF_COR__C
			END AS UF, 
		  HC_TIPO_DE_PESSOA__C AS TIPO_PESSOA, 
		  LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_RESIDENCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_01, 
		  SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_RESIDENCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_01, 
		  'FIXO' AS TIPO_TEL_01, 
		  LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_COMERCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_02, 
		  SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_COMERCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_02, 
		  'FIXO' AS TIPO_TEL_02, LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_OUTRO__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_03, 
		  SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_OUTRO__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_03, 
		  'FIXO' AS TIPO_TEL_03, 
		  LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_1__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_04, 
		  SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_1__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_04, 
		  'MÓVEL' AS TIPO_TEL_04, LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_2__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_05, 
		  SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_2__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_05, 
		  'MÓVEL' AS TIPO_TEL_05, LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_3__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_06, 
		  SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_3__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_06, 
		  'MÓVEL' AS TIPO_TEL_06, HC_TELEFONE_PRINCIPAL__C AS TEL_PRINCIPAL, 
		  HC_CLASSIFICACAO__C AS PUBLICO_ALVO, 
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
		  ROW_NUMBER() OVER(ORDER BY B.ID ASC) AS ROWNO
		FROM
		  CAMPAIGN_SALESFORCE A WITH(NOLOCK) 
		  INNER JOIN
			HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B WITH(NOLOCK) 
			ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C 
			AND A.HC_TIPO_DE_CLIENTE__C = B.HC_TIPO_DE_PESSOA__C 
			AND A.[TYPE] = B.HC_CLASSIFICACAO__C 
		  INNER JOIN
			CONTACT_SALESFORCE C WITH(NOLOCK)  
			ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C 
		WHERE
		  A.[TYPE] = 'Cliente' 
		  AND A.HC_FORMATO__C = 'Online' 
		  AND A.HC_FORNECEDOR__C = 'Tivit'
		  AND A.ID = '7016g000002O089AAC'
	) A
INNER JOIN
  CAMPAIGN_SALESFORCE CAMP 
  ON A.ID_CAMPANHA = CAMP.ID
WHERE
	A.ROWNO <= CAMP.HC_QUANTIDADE_DE_CONTATOS_NO_MAILING__C