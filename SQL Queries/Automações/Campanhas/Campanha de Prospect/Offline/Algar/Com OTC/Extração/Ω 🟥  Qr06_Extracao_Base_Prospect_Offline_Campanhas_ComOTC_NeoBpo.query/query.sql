SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    B.CPF,
    '' AS CNPJ,
    B.Id_Campanha,
    C.AccountId as ID,
    C.ID as Id_Contato,
    B.Celular1 as TEL_01,
    B.Celular2 as TEL_02,
    concat(B.Ddd1,B.Telefone1) as TEL_03,
    concat(B.Ddd2,B.Telefone2) as TEL_04,
    concat(B.Ddd3,B.Telefone3) as TEL_05

FROM
  Tb_Base_Prospect_OTC291_Filtrada_Algar A 
  INNER JOIN Tb_Base_Prospect_OTC291_Tratada_Algar B ON A.CPF = B.CPF
  INNER JOIN Contact_Salesforce C on B.CPF = C.HC_CPF_CNPJ__c
  INNER JOIN ACCOUNT_SALESFORCE D on C.AccountId = D.ID