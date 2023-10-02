SELECT
	A.HC_CPF_CNPJ__C AS ID,
	CASE WHEN (len(B.TEL_01) = 9) THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO_TEL_01,
	CASE WHEN (len(B.TEL_02) = 9) THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO_TEL_02,
	CASE WHEN (len(B.TEL_03) = 9) THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO_TEL_03,
	CASE WHEN (len(B.TEL_04) = 9) THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO_TEL_04,
	CASE WHEN (len(B.TEL_05) = 9) THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO_TEL_05,
	CASE WHEN (len(B.TEL_06) = 9) THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO_TEL_06
FROM
    HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE A
INNER JOIN Tb_Base_Prop_Ourocap_N_Pag B ON A.HC_CPF_CNPJ__C = B.CPF_CNPJ