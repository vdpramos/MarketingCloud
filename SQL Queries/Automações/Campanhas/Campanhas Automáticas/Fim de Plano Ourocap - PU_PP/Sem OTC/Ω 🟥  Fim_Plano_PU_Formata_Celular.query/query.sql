SELECT
  A.ID,
  '55' + REPLACE(REPLACE(REPLACE(REPLACE(A.CELULAR, '(', ''), ')', ''), ' ', ''), '-', '') AS CELULAR
FROM Fim_Plano_PU_semOTC_Publico_Inicial A
WHERE CELULAR != NULL