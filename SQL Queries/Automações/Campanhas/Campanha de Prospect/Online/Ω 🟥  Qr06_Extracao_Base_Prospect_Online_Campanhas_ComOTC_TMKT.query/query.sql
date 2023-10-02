SELECT COD_PARCEIRO,
    CPF,
    CNPJ,
    Id_Campanha,
    ID,
    Id_Contato,
    TEL_01,
    TEL_02,
    TEL_03,
    TEL_04, 
    null as 'Telefone Residencial'
FROM (SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.CPF,
    '' AS CNPJ,
    B.Id_Campanha,
    E.Id as ID,
    C.ID as Id_Contato,
    CASE WHEN B.Celular1 LIKE '%(0)%' THEN '' else B.Celular1 END as TEL_01,
    CASE WHEN B.Celular2 LIKE '%(0)%' THEN '' else B.Celular2 END as TEL_02,
    CASE WHEN b.TEL_RESIDENCIAL LIKE '%(0)%' THEN '' else b.TEL_RESIDENCIAL END as TEL_03,
    CASE WHEN b.TEL_COMERCIAL LIKE '%(0)%' THEN '' else b.TEL_COMERCIAL END as TEL_04,
    row_number() over (partition by A.CPF order by C.ID desc) AS ROW_ID

FROM
  Tb_Base_Prospect_OTC291_Filtrada_TMKT A 
  INNER JOIN Tb_Base_Prospect_OTC291_Tratada_TMKT B ON A.CPF = B.CPF
  INNER JOIN Contact_Salesforce C on RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, C.HC_CPF_CNPJ__c), 11) = B.CPF
  INNER JOIN ACCOUNT_SALESFORCE D on C.AccountId = D.ID
  INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce E ON A.CPF = E.CPF_CNPJ_Cliente__c) BASE
WHERE ROW_ID = 1
  