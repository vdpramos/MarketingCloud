SELECT
	B.*
FROM
  Fim_Plano_PM_semOTC_Publico_Inicial B
/* validações sendo feitas na query de publico inicial */
/* WHERE */
  /* IDADE_VALIDA = 1  */
  /* AND CONSELHEIRO = 0  */
  /* AND CLIENTE_PEP = 0  */
  /* AND DESEJA_CONTATO_TELEFONICO = 0  */
  /* AND COMPRA_RECENTE_OUROCAP = 0  */
  /* AND POSSUI_CONTA_ATIVA = 1 */
  /* AND POSSUI_TELEFONE_ATIVO = 1 */
  /* AND ( */
    /* (CELULAR_VALIDO = 1 AND NAO_DESEJA_RECEBER_SMS = 0) */
    /* OR  (EMAIL_VALIDO = 1 AND NAO_DESEJA_RECEBER_EMAIL = 0) */
  /* ) */
  /*AND QUARENTENA = 0*/
  /* AND NAO_IMPORTUNE IS NULL OR NAO_IMPORTUNE = 0 */