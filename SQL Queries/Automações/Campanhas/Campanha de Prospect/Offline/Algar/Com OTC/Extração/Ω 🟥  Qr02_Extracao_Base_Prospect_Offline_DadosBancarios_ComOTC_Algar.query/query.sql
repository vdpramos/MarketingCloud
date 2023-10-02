SELECT DISTINCT
  'TCBB' as COD_PARCEIRO,
  A.CPF,
  '' AS CNPJ,
  '001' as BANCO,
  B.AGENCIA,
  '' as Digito_Verificador_Agencia,
  B.CONTA AS CONTA_CORRENTE,
  '' as Digito_Verificador_Conta,
  '' as Agencia_Conta_Digito_Verificador,
  'CC' as Tipo_Conta
FROM
  TB_BASE_PROSPECT_OTC291_FILTRADA_ALGAR A 
  INNER JOIN
    TB_BASE_PROSPECT_COMOTC_TRATADA_ALGAR B 
    ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)