SELECT
  A.CPF_CNPJ,
  A.ID_PROPOSTA,
  '55' + REPLACE(REPLACE(REPLACE(REPLACE(A.CELULAR, '(', ''), ')', ''), ' ', ''), '-', '') AS CELULAR
FROM TB_BOAS_VINDAS_OUROCAP_PROSPOSTAS A
WHERE CELULAR IS NOT NULL