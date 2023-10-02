SELECT
  A.CODIGO_PARCEIRO,
  A.ID_CLIENTE,
  A.CODIGO_MCI,
  A.TIPO_PESSOA,
  A.CODIGO_CIC,
  A.DT_NASCIMENTO,
  A.NOME,
  A.UF_RESIDENCIAL,
  A.DDD1,
  A.TELEFONE1,
  A.DDD2,
  A.TELEFONE2,
  A.DDD3,
  A.TELEFONE3,
  A.CODIGO_PLANO,
  A.ORIGEM_SOLICITACAO,
  A.FILLER,
  A.CODIGO_RNA,
  A.VALOR_RENDIMENTOS,
  A.TIPO_CARTEIRA,
  A.NIVEL_RELACIONAMENTO,
  A.DATA_INFORMACAO,
  A.FILLER2,
  RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11) AS CPF,
  Left(B.NOME, CharIndex(' ', B.NOME)) AS PRIMEIRO_NOME,
  Reverse(Left(Reverse(B.Nome), CharIndex(' ', Reverse(B.Nome)))) AS SOBRENOME,
  CASE WHEN LEN(B.TEL_01) = 9 THEN '(' + SUBSTRING(B.DDD_01, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_01, 1, 5) + '-' + 
           SUBSTRING(B.TEL_01, 6, 4)
      ELSE '(' + SUBSTRING(B.DDD_01, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_01, 1, 4) + '-' + 
           SUBSTRING(B.TEL_01, 5, 4) END AS TEL_RESIDENCIAL,
  CASE WHEN LEN(B.TEL_02) = 9 THEN '(' + SUBSTRING(B.DDD_02, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_02, 1, 5) + '-' + 
           SUBSTRING(B.TEL_02, 6, 4)
      ELSE '(' + SUBSTRING(B.DDD_02, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_02, 1, 4) + '-' + 
           SUBSTRING(B.TEL_02, 5, 4) END AS TEL_COMERCIAL,
  CASE WHEN LEN(B.TEL_03) = 9 THEN '(' + SUBSTRING(B.DDD_03, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_03, 1, 5) + '-' + 
           SUBSTRING(B.TEL_03, 6, 4)
      ELSE '(' + SUBSTRING(B.DDD_03, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_03, 1, 4) + '-' + 
           SUBSTRING(B.TEL_03, 5, 4) END AS CELULAR1,
  CASE WHEN LEN(B.TEL_04) = 9 THEN '(' + SUBSTRING(B.DDD_04, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_04, 1, 5) + '-' + 
           SUBSTRING(B.TEL_04, 6, 4)
      ELSE '(' + SUBSTRING(B.DDD_04, 1, 3) + ') ' + 
           SUBSTRING(B.TEL_04, 1, 4) + '-' + 
           SUBSTRING(B.TEL_04, 5, 4) END AS CELULAR2,
  A.DT_NASCIMENTO_SF,
  B.QUARENTENA,
  B.SEXO,
  CONCAT(RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11),'Cliente') AS CPF_TIPO_RELACIONAMENTO,
  CONCAT(RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11),'52') AS CPF_CODIGO_PARCEIRO,
  B.ID_CAMPANHA,
  A.ALTA_RENDA
  FROM
    TB_BASE_OTC291_TRATADA A
INNER JOIN TB_BASE_PROSPECT_COMOTC_FILTRADA_TEO B ON A.CPF = B.CPF