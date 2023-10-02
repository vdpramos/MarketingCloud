SELECT A.*
FROM(SELECT 
  a.*,
  ROW_NUMBER() OVER (PARTITION BY CPF ORDER BY DT_NASCIMENTO_SF) AS number
FROM
  TB_BASE_PROSPECT_OTC291_TRATADA_ALGAR A
WHERE
  CODIGO_RNA = '000' 
  AND ENCARTEIRAMENTO_VALIDO = 1 
  AND NAO_IMPORTUNE = 0
  AND QUARENTENA = 0) A
WHERE NUMBER = 1