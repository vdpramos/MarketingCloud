SELECT
	B.CPF_CNPJ,
	B.Numero_do_Titulo,
	B.Serie_do_Titulo,
	B.Plano_do_Titulo,
	B.Id_Titulo,
	SUM(CASE WHEN T.HC_SITUACAO__C = 'Ativo' THEN 1 ELSE 0 END) AS QUANTIDADE_TITULOS_ANTERIORES_ATIVOS,
	SUM(CASE WHEN T.HC_SITUACAO__C IS NULL OR T.HC_SITUACAO__C != 'Ativo' THEN 1 ELSE 0 END) AS QUANTIDADE_TITULOS_ANTERIORES_INATIVOS
FROM Tb_Boas_Vindas_3_Meses_Clientes_E_Titulos B
INNER JOIN CAMPAIGN_SALESFORCE CS ON CS.ID = B.ID_CAMPANHA
INNER JOIN HC_TITULO__C_SALESFORCE T ON T.HC_CLIENTE_X_PARCEIRO__C = B.ID_CLIENTE_PARCEIRO
WHERE
	T.HC_CONTRATACAO__C < CS.HC_DATA_INICIAL_DE_COMPRA__C
	/* PARCEIRO TCBB PARA OUROCAP */
	AND T.HC_CODIGO_DO_PARCEIRO_NA_ORIGEM__C = 'TCBB'
GROUP BY B.CPF_CNPJ,
	B.Numero_do_Titulo,
	B.Serie_do_Titulo,
	B.Plano_do_Titulo,
	B.Id_Titulo
