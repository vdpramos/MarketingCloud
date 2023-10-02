SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.HC_CODIGO_DO_PRODUTO__C AS CODIGO,
    A.HC_PRECO__C AS VALOR,
	HC_REGRA_DE_COMERCIALIZACAO__C AS COD_TIPO_PLANO
FROM HC_PRECO_DO_PRODUTO__C_SALESFORCE A
INNER JOIN TB_BASE_PROSPECT_SEMOTC_FILTRADA_TMKT B ON A.ID = B.NOME_PRODUTO_VALOR