SELECT
	a.CPF_CNPJ,
	1 AS Nao_importune
FROM Close_the_loop_preparacao_OTC_tratada a
    INNER JOIN Tb_Base_Nao_Importune n ON a.Celular_1 = LTRIM(RTRIM(n.Telefone))
UNION
SELECT
	a.CPF_CNPJ,
	1 AS Nao_importune
FROM Close_the_loop_preparacao_OTC_tratada a
    INNER JOIN Tb_Base_Nao_Importune n ON a.Celular_2 = LTRIM(RTRIM(n.Telefone))
UNION
SELECT
	a.CPF_CNPJ,
	1 AS Nao_importune
FROM Close_the_loop_preparacao_OTC_tratada a
    INNER JOIN Tb_Base_Nao_Importune n ON a.Celular_3 = LTRIM(RTRIM(n.Telefone))
UNION
SELECT
	a.CPF_CNPJ,
	1 AS Nao_importune
FROM Close_the_loop_preparacao_OTC_tratada a
    INNER JOIN Tb_Base_Nao_Importune n ON a.Telefone_Brasilcap = LTRIM(RTRIM(n.Telefone))
UNION
SELECT
	a.CPF_CNPJ,
	1 AS Nao_importune
FROM Close_the_loop_preparacao_OTC_tratada a
    INNER JOIN Tb_Base_Nao_Importune n ON a.Telefone_comercial = LTRIM(RTRIM(n.Telefone))