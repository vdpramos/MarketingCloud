SELECT
  B.CPF_CNPJ,
  CMP.NAME AS CAMPANHA,
  PAR.HC_CODIGO_DO_PARCEIRO_CAP__C AS PARCEIRO,
  CONVERT(INTEGER, REL.HC_IDADE__C) AS IDADE,
  /* B.COMPRA_UTIMOS_30_DIAS AS COMPROU_ULTIMOS_30_DIAS, */
  /* B.CONSELHEIRO, */
  /* B.CLIENTE_PEP, */
  /* B.DESEJA_CONTATO_TELEFONICO AS NAO_DESEJA_RECEBER_LIGACOES, */
  /* B.POSSUI_TELEFONE_ATIVO, */
  /* B.POSSUI_TITULO_ATIVO, */
  B.POSSUI_CONTA_CORRENTE,
  Data_Participacao_Campanha,
  B.QUARENTENA,
  B.NAO_IMPORTUNE,
  CASE
    /* WHEN B.IDADE_VALIDA IS NULL OR B.IDADE_VALIDA = 0 THEN 'IDADE INVALIDA' */
    /* WHEN B.CONSELHEIRO IS NULL OR B.CONSELHEIRO = 1 THEN 'CONSELHEIRO' */
    /* WHEN B.CLIENTE_PEP IS NULL OR B.CLIENTE_PEP = 1 THEN 'PEP' */
    /* WHEN B.DESEJA_CONTATO_TELEFONICO IS NULL OR B.DESEJA_CONTATO_TELEFONICO = 1 THEN 'NÃO DESEJA CONTATO TELEFONICO' */
    /* WHEN B.POSSUI_TELEFONE_ATIVO IS NULL OR B.POSSUI_TELEFONE_ATIVO = 0 THEN 'NÃO POSSUI TELEFONE ATIVO' */
    /* WHEN B.NOME_VALIDA IS NULL OR B.NOME_VALIDA = 0 THEN 'NOME VALIDA' */
    WHEN B.POSSUI_CONTA_CORRENTE IS NULL OR B.POSSUI_CONTA_CORRENTE = 0 THEN 'NÃO POSSUI CONTA CORRENTE'
    WHEN B.QUARENTENA IS NULL OR B.QUARENTENA = 1 THEN 'EM QUARENTENA'
    WHEN B.NAO_IMPORTUNE IS NULL OR B.NAO_IMPORTUNE = 1 THEN 'NÃO IMPORTUNE'
  END AS RESULTADO
  /* B.NOME_VALIDA */
FROM
  TB_BASE_EX_CLIENTE_COMOTC_NEOBPO B
LEFT JOIN CAMPAIGN_SALESFORCE CMP ON B.ID_CAMPANHA = CMP.ID
LEFT JOIN HC_PARCEIRO__C_SALESFORCE PAR ON B.PARCEIRO = PAR.ID
LEFT JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE REL ON B.ID_CLIENTE_PARCEIRO = REL.ID
LEFT JOIN TB_BASE_QUARENTENA Q ON Q.CPF_CNPJ = B.CPF_CNPJ
WHERE
  B.CPF_CNPJ IS NOT NULL
  AND (
  /* (B.IDADE_VALIDA IS NULL OR B.IDADE_VALIDA = 0) */
  /* OR (B.CONSELHEIRO IS NULL OR B.CONSELHEIRO = 1) */
  /* OR (B.CLIENTE_PEP IS NULL OR B.CLIENTE_PEP = 1) */
  /* OR (B.DESEJA_CONTATO_TELEFONICO IS NULL OR B.DESEJA_CONTATO_TELEFONICO = 1) */
  /* OR (B.POSSUI_TELEFONE_ATIVO IS NULL OR B.POSSUI_TELEFONE_ATIVO = 0) */
  /* OR */ 
  (B.POSSUI_CONTA_CORRENTE IS NULL OR B.POSSUI_CONTA_CORRENTE = 0)
  OR (B.QUARENTENA IS NULL OR B.QUARENTENA = 1)
  OR (B.NAO_IMPORTUNE IS NULL OR B.NAO_IMPORTUNE = 1)
  /* OR B.ULTIMO_RESGATE = 1 */
  /* OR B.SITUACAO_RESGATE = 1 */
  /* OR (B.NOME_VALIDA IS NULL OR B.NOME_VALIDA = 0) */
  )
