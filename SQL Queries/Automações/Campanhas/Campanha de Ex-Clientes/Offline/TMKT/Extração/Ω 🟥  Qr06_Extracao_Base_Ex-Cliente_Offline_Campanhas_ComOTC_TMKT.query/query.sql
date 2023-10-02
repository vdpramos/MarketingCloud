SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    B.CPF,
    '' AS CNPJ,
	B.Id_Campanha,
    B.Id_Cliente_Parceiro as Id,
    C.Id_Contato,
    '(' + SUBSTRING(C.Ddd_Tel_01, 1, 3) + ') ' + 
           SUBSTRING(C.TEL_01, 1, 4) + '-' + 
           SUBSTRING(C.TEL_01, 5, 4) AS TEL_01,
  '(' + SUBSTRING(C.Ddd_Tel_02, 1, 3) + ') ' + 
           SUBSTRING(C.TEL_02, 1, 4) + '-' + 
           SUBSTRING(C.TEL_02, 5, 4) AS TEL_02,
  '(' + SUBSTRING(C.Ddd_Tel_03, 1, 3) + ') ' + 
           CASE WHEN LEN(C.TEL_03) = 9 THEN SUBSTRING(C.TEL_03, 1, 5) + '-' + 
           SUBSTRING(C.TEL_03, 6, 4)
           ELSE SUBSTRING(C.TEL_03, 1, 4) + '-' + 
           SUBSTRING(C.TEL_03, 5, 4) END AS TEL_03,
  '(' + SUBSTRING(C.Ddd_Tel_04, 1, 3) + ') ' + 
          CASE WHEN LEN(C.TEL_04) = 9 THEN SUBSTRING(C.TEL_04, 1, 5) + '-' + 
           SUBSTRING(C.TEL_04, 6, 4)
           ELSE SUBSTRING(C.TEL_04, 1, 4) + '-' + 
           SUBSTRING(C.TEL_04, 5, 4) END AS TEL_04,
           
  '(' + SUBSTRING(C.Ddd_Tel_05, 1, 3) + ') ' + 
          CASE WHEN LEN(C.TEL_05) = 9 THEN SUBSTRING(C.TEL_05, 1, 5) + '-' + 
           SUBSTRING(C.TEL_05, 6, 4)
           ELSE SUBSTRING(C.TEL_05, 1, 4) + '-' + 
           SUBSTRING(C.TEL_05, 5, 4) END AS TEL_05,
           
    '(' + SUBSTRING(C.Ddd_Tel_06, 1, 3) + ') ' + 
          CASE WHEN LEN(C.TEL_06) = 9 THEN SUBSTRING(C.TEL_06, 1, 5) + '-' + 
           SUBSTRING(C.TEL_06, 6, 4)
           ELSE SUBSTRING(C.TEL_06, 1, 4) + '-' + 
           SUBSTRING(C.TEL_06, 5, 4) END AS TEL_06

FROM
  Tb_Base_Ex_Cliente_OTC291_Filtrada_TMKT A 
  INNER JOIN Tb_Base_Ex_Cliente_OTC291_Tratada_TMKT B ON A.CPF = B.CPF
  INNER JOIN Tb_Base_Ex_Cliente_ComOTC_Filtrada_TMKT C on B.CPF =C.CPF_CNPJ