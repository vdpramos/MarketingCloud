SELECT DISTINCT
  'TCBB' as COD_PARCEIRO,
  A.CPF,
  '' AS CNPJ,
  '001' as BANCO,
  B.AGENCIA,
  Digito_Verificador_Agencia,
  B.Conta as CONTA_CORRENTE,
  Digito_Verificador_Conta,
  Agencia_Conta_Digito_Verificador,
  'CC' as Tipo_Conta
FROM
  TB_BASE_PROSPECT_OTC291_FILTRADA_TEO A 
  INNER JOIN
    TB_BASE_PROSPECT_COMOTC_TRATADA_TEO B 
    ON A.CPF = RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, B.CPF), 11)
    INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce C ON A.CPF = C.CPF_CNPJ_Cliente__c