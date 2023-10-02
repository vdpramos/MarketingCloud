SELECT
  CPF_CNPJ,
  NOME,
  ID_CAMPANHA, 
  ID_CLIENTE_PARCEIRO, 
  ID_CONTATO, 
  ID_CLIENTE,
  NAO_DESEJA_RECEBER_EMAIL,
  NAO_DESEJA_RECEBER_SMS,
  HC_DATA_NASCIMENTO__C,
  EMAIL_VALIDO,
  CELULAR_VALIDO,
  EMAIL AS EMAILADDRESS,
  CELULAR AS MOBILEPHONE,
  'BR' AS LOCALE, 
  DATA_EXECUCAO
FROM TB_CAMPANHA_ANIVERSARIANTES_BASE
WHERE 
  (EMAIL_VALIDO = '1' OR CELULAR_VALIDO = '1')
  AND NAO_IMPORTUNE = 0