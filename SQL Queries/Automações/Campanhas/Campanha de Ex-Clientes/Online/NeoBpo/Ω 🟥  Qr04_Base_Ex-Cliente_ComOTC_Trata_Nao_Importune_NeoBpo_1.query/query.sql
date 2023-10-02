SELECT
	A.CPF_CNPJ AS ID,
	1 AS NAO_IMPORTUNE
FROM TB_BASE_EX_CLIENTE_COMOTC_NEOBPO A
INNER JOIN TB_BASE_NAO_IMPORTUNE N ON ISNULL(CONCAT(A.DDD_TEL_01, A.TEL_01), '00000000000') = LTRIM(RTRIM(N.TELEFONE))