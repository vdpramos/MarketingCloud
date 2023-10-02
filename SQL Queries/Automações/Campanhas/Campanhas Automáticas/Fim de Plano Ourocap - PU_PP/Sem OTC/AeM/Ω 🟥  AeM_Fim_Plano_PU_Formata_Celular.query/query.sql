SELECT
  A.ID,
  '55' + REPLACE(REPLACE(REPLACE(REPLACE(A.CELULAR, '(', ''), ')', ''), ' ', ''), '-', '') AS CELULAR
FROM AeM_Fim_Plano_PU_semOTC_Publico_Inicial A
WHERE CELULAR IS NOT NULL