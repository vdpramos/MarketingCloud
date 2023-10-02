SELECT
  A.*,
  A.CPF_Codigo_Parceiro as CPF_Codigo_Parceiro_Unico,
  row_number() over(order by a.cpf) as row
FROM Tb_Base_Prospect_OTC291_Online_Tratada_AeC A
LEFT OUTER JOIN ( 
  SELECT
    COUNT(1) as CPFS_FALTANDO_NO_OTC
  FROM  Tb_Base_Prospect_ComOTC_Online_Filtrada_AeC ENV
  LEFT JOIN Tb_Base_Prospect_OTC291_Online_Tratada_AeC RET ON ENV.CPF = RET.CPF
  WHERE RET.CPF IS NULL
) B ON 1 = 1
WHERE B.CPFS_FALTANDO_NO_OTC = 0 /* SIGNIFICA QUE TODOS OS CONTATOS JÁ ESTÃO NO OTC291 */
  /* VALIDAÇÕES POR CONTATO DO OTC */
  AND A.CODIGO_RNA = '000'
  AND A.ALTA_RENDA = 0











