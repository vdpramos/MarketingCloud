SELECT DISTINCT
  'TCBB' AS COD_PARCEIRO,
  B.CPF_CNPJ as CPF,
  '' AS CNPJ,
  B.CEP
FROM
  Tb_Base_Ex_Cliente_OTC291_Filtrada_Algar A 
  INNER JOIN
    Tb_Base_Ex_Cliente_ComOTC_Algar_filtrada B 
    ON A.CPF = B.CPF_CNPJ 