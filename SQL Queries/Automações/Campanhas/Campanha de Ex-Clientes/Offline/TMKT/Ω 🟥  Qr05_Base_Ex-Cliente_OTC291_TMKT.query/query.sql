SELECT
	SUBSTRING(RETORNO, 1, 3) AS CODIGO_PARCEIRO,
	SUBSTRING(RETORNO, 4, 9) AS ID_CLIENTE,
	SUBSTRING(RETORNO, 13, 9) AS CODIGO_MCI,
	SUBSTRING(RETORNO, 22, 1) AS TIPO_PESSOA,
	SUBSTRING(RETORNO, 23, 15) AS CODIGO_CIC,
	SUBSTRING(RETORNO, 38, 8) AS DT_NASCIMENTO,
	UPPER(SUBSTRING(RETORNO, 46, 60)) AS NOME,
	SUBSTRING(RETORNO, 107, 2) AS UF_RESIDENCIAL,
	SUBSTRING(RETORNO, 109, 4) AS DDD1,
	SUBSTRING(RETORNO, 113, 10) AS TELEFONE1,
	SUBSTRING(RETORNO, 123, 4) AS DDD2,
	SUBSTRING(RETORNO, 127, 10) AS TELEFONE2,
	SUBSTRING(RETORNO, 137, 4) AS DDD3,
	SUBSTRING(RETORNO, 141, 10) AS TELEFONE3,
	SUBSTRING(RETORNO, 151, 5) AS CODIGO_PLANO,
	SUBSTRING(RETORNO, 156, 2) AS ORIGEM_SOLICITACAO,
	SUBSTRING(RETORNO, 158, 73) AS FILLER,
	SUBSTRING(RETORNO, 231, 3) AS CODIGO_RNA,
	SUBSTRING(RETORNO, 234, 15) AS VALOR_RENDIMENTOS,
	SUBSTRING(RETORNO, 249, 4) AS TIPO_CARTEIRA,
	SUBSTRING(RETORNO, 253, 5) AS NIVEL_RELACIONAMENTO,
	SUBSTRING(RETORNO, 258, 26) AS DATA_INFORMACAO,
	SUBSTRING(RETORNO, 284, 17) AS FILLER2,
	SUBSTRING(RETORNO, 27, 11) AS CPF,
	Left(B.NOME, CharIndex(' ', B.NOME)) AS PRIMEIRO_NOME,
  Reverse(Left(Reverse(B.Nome), CharIndex(' ', Reverse(B.Nome)))) AS SOBRENOME,
	SUBSTRING(RETORNO, 38, 8) AS DT_NASCIMENTO_SF,
	CONCAT(SUBSTRING(RETORNO, 27, 11),'Cliente') AS CPF_TIPO_RELACIONAMENTO,
	B.CPF_CNPJ_CODIGO_DO_PARCEIRO,
	B.ID_CLIENTE_PARCEIRO,
	B.ID_CONTATO,
	B.ID_CAMPANHA,
	B.Ddd_Tel_01 as DDD_01,	
	B.TEL_01,	
	B.Ddd_Tel_02 as DDD_02,	
	B.TEL_02,	
	B.Ddd_Tel_03 as DDD_03,	
	B.TEL_03,	
	B.Ddd_Tel_04 as DDD_04,	
	B.TEL_04,	
	B.Ddd_Tel_05 as DDD_05,	
	B.TEL_05,
	B.CEP,
	B.SEXO,
	/*CONCAT(CONVERT(INT, SUBSTRING(RETORNO, 234, 13)),'.',RIGHT(SUBSTRING(RETORNO, 234, 15), 2)) AS FAIXA_RENDA_MENSAL,*/
	CASE WHEN B.CAMPANHA_VALIDA_ENCARTEIRAMENTO = 1 AND CONVERT(INT,SUBSTRING(RETORNO, 249, 4)) IN (31,32,33,34,35,40,41,42,43,44,45,46,47,48,49,54,10,50,57) 
	THEN 1 ELSE 0 END AS Alta_Renda,
	b.Id_Produto,
	b.Id_Produto_Valor
FROM
	TB_BASE_EX_CLIENTE_OTC291_TMKT A
	INNER JOIN TB_BASE_EX_CLIENTE_COMOTC_TMKT B ON SUBSTRING(RETORNO, 27, 11) = B.CPF_CNPJ
	WHERE B.QUARENTENA = 0