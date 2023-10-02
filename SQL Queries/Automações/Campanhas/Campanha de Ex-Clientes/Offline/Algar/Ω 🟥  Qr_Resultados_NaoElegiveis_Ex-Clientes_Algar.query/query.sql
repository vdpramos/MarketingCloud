SELECT
  B.CPF_CNPJ,
  CMP.NAME AS CAMPANHA,
  CASE
    /* WHEN B.IDADE_VALIDA IS NULL OR B.IDADE_VALIDA = 0 THEN 'IDADE INVALIDA' */
    /* WHEN B.CONSELHEIRO IS NULL OR B.CONSELHEIRO = 1 THEN 'CONSELHEIRO' */
    /* WHEN B.CLIENTE_PEP IS NULL OR B.CLIENTE_PEP = 1 THEN 'PEP' */
    /* WHEN B.DESEJA_CONTATO_TELEFONICO IS NULL OR B.DESEJA_CONTATO_TELEFONICO = 1 THEN 'NÃO DESEJA CONTATO TELEFONICO' */
    /* WHEN B.POSSUI_TELEFONE_ATIVO IS NULL OR B.POSSUI_TELEFONE_ATIVO = 0 THEN 'NÃO POSSUI TELEFONE ATIVO' */
    /* WHEN B.POSSUI_CONTA_CORRENTE IS NULL OR B.POSSUI_CONTA_CORRENTE = 0 THEN 'NÃO POSSUI CONTA CORRENTE' */
    WHEN B.COMPRA_UTIMOS_30_DIAS IS NULL OR B.COMPRA_UTIMOS_30_DIAS = 1 THEN 'COMPROU NOS ULTIMOS 30 DIAS'
    WHEN B.POSSUI_TITULO_ATIVO IS NULL OR B.POSSUI_TITULO_ATIVO = 1 THEN 'POSSUI TITULO ATIVO'
    WHEN B.NAO_IMPORTUNE IS NULL OR B.NAO_IMPORTUNE = 1 THEN 'NÃO IMPORTUNE'
    WHEN B.CONTA_APTA IS NULL OR B.CONTA_APTA = 0 THEN 'CONTA BANCARIA INAPTA'
    
    /* WHEN B.QUARENTENA IS NULL OR B.QUARENTENA = 1 THEN 'EM QUARENTENA' */
  END AS RESULTADO
 
FROM
  Publico_Inapto_Ex_Clientes_Algar B
LEFT JOIN CAMPAIGN_SALESFORCE CMP ON B.ID_CAMPANHA = CMP.ID
LEFT JOIN TB_BASE_QUARENTENA Q ON Q.CPF_CNPJ = B.CPF_CNPJ