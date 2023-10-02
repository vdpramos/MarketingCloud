SELECT
  A.CPF_CNPJ,
  A.ID_PROPOSTA,
  '55' + REPLACE(REPLACE(REPLACE(REPLACE(A.CELULAR, '(', ''), ')', ''), ' ', ''), '-', '') AS CELULAR
FROM AeM_Tb_Boas_Vindas_Ourocap_Prospostas A
WHERE CELULAR IS NOT NULL