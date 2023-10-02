SELECT
	A.CPF,
  A.ID_CAMPANHA,
	1 AS NAO_IMPORTUNE
FROM RECOMANDO_PUBLICO_INICIAL A
INNER JOIN TB_BASE_NAO_IMPORTUNE N ON RIGHT(ISNULL(A.CELULAR, '00000000000'), LEN(LTRIM(RTRIM(N.TELEFONE)))) = LTRIM(RTRIM(N.TELEFONE))
INNER JOIN CAMPAIGN_SALESFORCE CMP ON CMP.ID = A.ID_CAMPANHA
WHERE CELULAR != NULL AND CMP.HC_VALIDA_NAO_IMPORTUNE__C = 1