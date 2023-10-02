SELECT 
  COD_PARCEIRO,
  CPF,
  CNPJ,
  TIPO,
  DDD,
  TELEFONE
FROM (

  SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.CPF,
    '' AS CNPJ,
    CASE WHEN LEN(B.TEL_01) >= 9 THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO,
    B.DDD_01 AS DDD,
    B.TEL_01 AS TELEFONE
  FROM
    TB_BASE_PROSPECT_OTC291_FILTRADA_TEO A 
    INNER JOIN
      TB_BASE_PROSPECT_COMOTC_TRATADA_TEO B 
      ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)
  WHERE
       LEN(NULLIF(TEL_01, '')) < 10
  AND NOT( LEN(TEL_01) = 8 AND TEL_01 LIKE '9%' )
  
  UNION ALL

  SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.CPF,
    '' AS CNPJ,
    CASE WHEN LEN(B.TEL_02) >= 9 THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO,
    B.DDD_02 AS DDD,
    B.TEL_02 AS TELEFONE
  FROM
    TB_BASE_PROSPECT_OTC291_FILTRADA_TEO A 
    INNER JOIN
      TB_BASE_PROSPECT_COMOTC_TRATADA_TEO B 
      ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)
  WHERE
       LEN(NULLIF(TEL_02, '')) < 10
  AND NOT( LEN(TEL_02) = 8 AND TEL_02 LIKE '9%' )
  
  UNION ALL

  SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.CPF,
    '' AS CNPJ,
    CASE WHEN LEN(B.TEL_03) >= 9 THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO,
    B.DDD_03 AS DDD,
    B.TEL_03 AS TELEFONE
  FROM
    TB_BASE_PROSPECT_OTC291_FILTRADA_TEO A 
    INNER JOIN
      TB_BASE_PROSPECT_COMOTC_TRATADA_TEO B 
      ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)
  WHERE
       LEN(NULLIF(TEL_03, '')) < 10
  AND NOT( LEN(TEL_03) = 8 AND TEL_03 LIKE '9%' )
  
  UNION ALL

  SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.CPF,
    '' AS CNPJ,
    CASE WHEN LEN(B.TEL_04) >= 9 THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO,
    B.DDD_04 AS DDD,
    B.TEL_04 AS TELEFONE
  FROM
    TB_BASE_PROSPECT_OTC291_FILTRADA_TEO A 
    INNER JOIN
      TB_BASE_PROSPECT_COMOTC_TRATADA_TEO B 
      ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)
  WHERE
       LEN(NULLIF(TEL_04, '')) < 10
  AND NOT( LEN(TEL_04) = 8 AND TEL_04 LIKE '9%' )
  
  UNION ALL

  SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.CPF,
    '' AS CNPJ,
    CASE WHEN LEN(B.TEL_05) >= 9 THEN 'MÓVEL' ELSE 'FIXO' END AS TIPO,
    B.DDD_05 AS DDD,
    B.TEL_05 AS TELEFONE
  FROM
    TB_BASE_PROSPECT_OTC291_FILTRADA_TEO A 
    INNER JOIN
      TB_BASE_PROSPECT_COMOTC_TRATADA_TEO B 
      ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)
  WHERE
      LEN(NULLIF(TEL_05, '')) < 10
  AND NOT( LEN(TEL_05) = 8 AND TEL_05 LIKE '9%' )
) A