SELECT
  A.*
FROM Tb_Base_Ex_Cliente_ComOTC_Algar A
WHERE
  /* IDADE_VALIDA = 1 */
  /* AND CONSELHEIRO = 0 */
  /* AND CLIENTE_PEP = 0 */
  /* AND DESEJA_CONTATO_TELEFONICO = 0 */
  /* AND POSSUI_TELEFONE_ATIVO = 1 */
  /* AND POSSUI_CONTA_CORRENTE = 1 */
  COMPRA_UTIMOS_30_DIAS = 0
  AND POSSUI_TITULO_ATIVO = 0
  /* AND QUARENTENA = 0 */
  AND NAO_IMPORTUNE = 0
  AND CONTA_APTA = 1