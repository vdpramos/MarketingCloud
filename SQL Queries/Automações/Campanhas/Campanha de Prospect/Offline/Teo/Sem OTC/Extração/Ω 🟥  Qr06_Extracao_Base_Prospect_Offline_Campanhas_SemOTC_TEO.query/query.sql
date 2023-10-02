SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    B.CPF,
    '' AS CNPJ,
    B.Id_Campanha,
    C.AccountId as ID,
    C.ID as Id_Contato,
    concat(B.DDD_01,B.TEL_01) as TEL_01,
    concat(B.DDD_02,B.TEL_02) as TEL_02,
    concat(B.DDD_03,B.TEL_03) as TEL_03,
    concat(B.DDD_04,B.TEL_04) as TEL_04,
    concat(B.DDD_05,B.TEL_05) as TEL_05

FROM
  Tb_Base_Prospect_SemOTC_Filtrada_TEO A 
  INNER JOIN Tb_Base_Prospect_SemOTC_Tratada_TEO B ON A.CPF = B.CPF
  INNER JOIN Contact_Salesforce C on B.CPF = C.HC_CPF_CNPJ__c
  INNER JOIN ACCOUNT_SALESFORCE D on C.AccountId = D.ID