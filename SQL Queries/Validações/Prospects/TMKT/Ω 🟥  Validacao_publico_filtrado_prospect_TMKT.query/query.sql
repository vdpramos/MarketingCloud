SELECT
  B.*
FROM Validacao_Prospect_ComOTC_Tratada_TMKT B
WHERE
    IDADE_VALIDA = 1
  AND CONTA_CORRENTE = 1
  AND QUARENTENA = 0
  AND CONSELHEIRO = 0 
  /* AND CLIENTE = 0 */
  /* AND VALIDA_RNA = 1 */
  AND CEP_VALIDO = 1
  AND NAO_IMPORTUNE = 0