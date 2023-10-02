SELECT
  A.*
FROM Prop_Ourocap_N_Pag_OTC291_Tratada A
LEFT OUTER JOIN ( 
  SELECT
    COUNT(1) as CPFS_FALTANDO_NO_OTC
  FROM Tb_Base_Prop_Ourocap_N_Pag_Filtrada ENV
  LEFT JOIN Prop_Ourocap_N_Pag_OTC291_Tratada RET ON ENV.CPF_CNPJ = RET.CPF
  WHERE RET.CPF IS NULL
) B ON 1 = 1
WHERE A.CODIGO_RNA = '000'
  AND A.ALTA_RENDA = 0