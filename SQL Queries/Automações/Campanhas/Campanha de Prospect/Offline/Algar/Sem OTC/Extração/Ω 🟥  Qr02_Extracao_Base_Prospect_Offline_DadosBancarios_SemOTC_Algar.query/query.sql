SELECT DISTINCT
  'TCBB' as COD_PARCEIRO,
  CPF,
  '' AS CNPJ,
  '' as BANCO,
  AGENCIA,
  '' as Digito_Verificador_Agencia,
  CONTA_CORRENTE,
  '' as Digito_Verificador_Conta,
  '' as Agencia_Conta_Digito_Verificador,
  'CC' as Tipo_Conta
FROM
  TB_BASE_PROSPECT_SEMOTC_FILTRADA_ALGAR