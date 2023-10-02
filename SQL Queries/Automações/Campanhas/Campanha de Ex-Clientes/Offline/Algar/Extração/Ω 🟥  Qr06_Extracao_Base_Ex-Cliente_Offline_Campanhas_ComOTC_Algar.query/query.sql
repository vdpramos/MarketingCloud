SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    B.CPF,
    '' AS CNPJ,
	B.Id_Campanha, 
	B.Id_Cliente_Parceiro as Id,
    C.Id_Contato,
    '(' + SUBSTRING(c.DDD_TEL_01, 1, 3) + ') ' + 
           SUBSTRING(c.TEL_01, 1, 4) + '-' + 
           SUBSTRING(c.TEL_01, 5, 4) AS TEL_01,
  '(' + SUBSTRING(c.DDD_TEL_02, 1, 3) + ') ' + 
           SUBSTRING(c.TEL_02, 1, 4) + '-' + 
           SUBSTRING(c.TEL_02, 5, 4) AS TEL_02,
  '(' + SUBSTRING(c.DDD_TEL_03, 1, 3) + ') ' + 
           CASE WHEN LEN(c.TEL_03) = 9 THEN SUBSTRING(c.TEL_03, 1, 5) + '-' + 
           SUBSTRING(c.TEL_03, 6, 4)
           ELSE SUBSTRING(c.TEL_03, 1, 4) + '-' + 
           SUBSTRING(c.TEL_03, 5, 4) END AS TEL_03,
  '(' + SUBSTRING(c.DDD_TEL_04, 1, 3) + ') ' + 
          CASE WHEN LEN(c.TEL_04) = 9 THEN SUBSTRING(c.TEL_04, 1, 5) + '-' + 
           SUBSTRING(c.TEL_04, 6, 4)
           ELSE SUBSTRING(c.TEL_04, 1, 4) + '-' + 
           SUBSTRING(c.TEL_04, 5, 4) END AS TEL_04,
           
  '(' + SUBSTRING(c.DDD_TEL_05, 1, 3) + ') ' + 
          CASE WHEN LEN(c.TEL_05) = 9 THEN SUBSTRING(c.TEL_05, 1, 5) + '-' + 
           SUBSTRING(c.TEL_05, 6, 4)
           ELSE SUBSTRING(c.TEL_05, 1, 4) + '-' + 
           SUBSTRING(c.TEL_05, 5, 4) END AS TEL_05,
    '(' + SUBSTRING(c.DDD_TEL_06, 1, 3) + ') ' + 
          CASE WHEN LEN(c.TEL_06) = 9 THEN SUBSTRING(c.TEL_06, 1, 5) + '-' + 
           SUBSTRING(c.TEL_06, 6, 4)
           ELSE SUBSTRING(c.TEL_06, 1, 4) + '-' + 
           SUBSTRING(c.TEL_06, 5, 4) END AS TEL_06
FROM
  Tb_Base_Ex_Cliente_OTC291_Filtrada_Algar A 
  INNER JOIN Tb_Base_Ex_Cliente_OTC291_Tratada_Algar B ON A.CPF = B.CPF
  INNER JOIN Tb_Base_Ex_Cliente_ComOTC_Algar_filtrada C on B.CPF =C.CPF_CNPJ