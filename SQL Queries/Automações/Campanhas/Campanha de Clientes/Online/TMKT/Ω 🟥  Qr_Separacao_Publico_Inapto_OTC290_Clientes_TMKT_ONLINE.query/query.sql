SELECT
  CPF_CNPJ,
  COMPRA_UTIMOS_30_DIAS,
  POSSUI_TITULO_ATIVO,
  NAO_IMPORTUNE,
  ID_campanha
FROM Tb_Base_Cliente_TMKT_ONLINE
WHERE
 NOT( /* IDADE_VALIDA = 1 */
  /* AND CONSELHEIRO = 0 */
  /* AND CLIENTE_PEP = 0 */
  /* AND DESEJA_CONTATO_TELEFONICO = 0 */
  /* AND POSSUI_TELEFONE_ATIVO = 1 */
  /* AND POSSUI_CONTA_CORRENTE = 1 */
  COMPRA_UTIMOS_30_DIAS = 'False' 
  AND POSSUI_TITULO_ATIVO = 'true'
  AND QUARENTENA = 0
  AND NAO_IMPORTUNE = 'False')