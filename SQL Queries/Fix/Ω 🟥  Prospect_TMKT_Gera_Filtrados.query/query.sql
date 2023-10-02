SELECT
  B.*
FROM TB_BASE_PROSPECT_COMOTC_TRATADA_TMKT B
inner join Tb_Base_OTC291_Tratada otc291 on b.cpf = otc291.cpf
WHERE
    b.IDADE_VALIDA = 1
  AND b.CONTA_CORRENTE = 1
  /* AND QUARENTENA = 0  */
  AND b.CONSELHEIRO = 0 
  /* AND CLIENTE = 0 */
  /* AND VALIDA_RNA = 1 */
  AND b.CEP_VALIDO = 1
  AND b.NAO_IMPORTUNE = 0
