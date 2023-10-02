SELECT
  ORIGEM.CPF as CPF_CNPJ,
  CMP.NAME AS CAMPANHA,
  /* PAR.HC_CODIGO_DO_PARCEIRO_CAP__C AS PARCEIRO, */
  /* CONVERT(INTEGER, REL.HC_IDADE__C) AS  IDADE, */
  /* DATEDIFF(YY,
  CAST(ORIGEM.DATA_NASCIMENTO AS DATE),
  GETDATE()) AS IDADE, */
  /* ORIGEM.COMPRA_UTIMOS_30_DIAS AS COMPROU_ULTIMOS_30_DIAS, */
  /* ORIGEM.CLIENTE_PEP, */
  /* ORIGEM.CLIENTE, */
  /* ORIGEM.CONSELHEIRO, */
  /* ORIGEM.DESEJA_CONTATO_TELEFONICO AS NAO_DESEJA_RECEBER_LIGACOES, */
  /* ORIGEM.POSSUI_TELEFONE_ATIVO, */
  /* ORIGEM.POSSUI_CONTA_CORRENTE, */
  /* ORIGEM.CONTA_CORRENTE AS POSSUI_CONTA_CORRENTE, */
  /* ORIGEM.POSSUI_TITULO_ATIVO, */
  /* ORIGEM.QUARENTENA, */
  /* ORIGEM.NAO_IMPORTUNE, */
  /* ORIGEM.CEP_VALIDO, */
  OTC291.ALTA_RENDA,
  /* OTC291.ENCARTEIRAMENTO_VALIDO, */
  CASE
    WHEN OTC291.CODIGO_RNA IS NULL OR OTC291.CODIGO_RNA != '000' THEN 'EXCLUIDO RNA'
    WHEN OTC291.ALTA_RENDA IS NULL OR OTC291.ALTA_RENDA != 0 THEN 'ALTA RENDA'
    /* WHEN (OTC291.ENCARTEIRAMENTO_VALIDO IS NULL OR OTC291.ENCARTEIRAMENTO_VALIDO != 1) THEN 'ENCARTEIRAMENTO INVALIDO' */
  END AS RESULTADO
FROM TB_BASE_PROSPECT_OTC291_ONLINE_TRATADA_TMKT OTC291
INNER JOIN TB_BASE_PROSPECT_ONLINE_TRATADA_TMKT ORIGEM ON ORIGEM.cpf = OTC291.CPF
LEFT JOIN CAMPAIGN_SALESFORCE CMP ON ORIGEM.ID_CAMPANHA = CMP.ID

WHERE 
  (OTC291.CODIGO_RNA IS NULL OR OTC291.CODIGO_RNA != '000')
  OR (OTC291.ALTA_RENDA IS NULL OR OTC291.ALTA_RENDA != 0)
  /* OR (OTC291.ENCARTEIRAMENTO_VALIDO IS NULL OR OTC291.ENCARTEIRAMENTO_VALIDO != 1) */