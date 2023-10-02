SELECT
  A.*,
  A.CPF_Codigo_Parceiro as CPF_Codigo_Parceiro_Unico,
  row_number() over(order by a.cpf) as row
FROM TB_BASE_PROSPECT_OTC291_TRATADA_TMKT A
LEFT OUTER JOIN ( 
  SELECT
    COUNT(1) as CPFS_FALTANDO_NO_OTC
  FROM Tb_Base_Prospect_ComOTC_Filtrada_TMKT ENV
  LEFT JOIN TB_BASE_PROSPECT_OTC291_TRATADA_TMKT RET ON ENV.CPF = RET.CPF
  WHERE RET.CPF IS NULL
) B ON 1 = 1
WHERE B.CPFS_FALTANDO_NO_OTC = 0 /* SIGNIFICA QUE TODOS OS CONTATOS JÁ ESTÃO NO OTC291 */
  /* VALIDAÇÕES POR CONTATO DO OTC */
  AND A.CODIGO_RNA = '000'
  AND A.ALTA_RENDA = 0