SELECT DISTINCT
  'TCBB' AS COD_PARCEIRO,
  A.CPF,
  '' AS CNPJ,
  B.CEP
FROM
  TB_BASE_PROSPECT_OTC291_FILTRADA_ALGAR A 
  INNER JOIN
    TB_BASE_PROSPECT_COMOTC_TRATADA_ALGAR B 
    ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)