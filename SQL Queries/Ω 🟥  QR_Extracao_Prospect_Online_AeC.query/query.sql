SELECT COD_PARCEIRO,
    CPF,
    CNPJ,
    NULL AS Id_Cliente,
    Id_Campanha,
    IDCP,
    Id_Contato,
    replace (replace (replace (replace (TEL_01, '(', ''),')', ''),'-', ''),' ', '') as TEL_01,
    replace (replace (replace (replace (TEL_02, '(', ''),')', ''),'-', ''),' ', '') as TEL_02,
    replace (replace (replace (replace (TEL_03, '(', ''),')', ''),'-', ''),' ', '') as TEL_03,
    replace (replace (replace (replace (TEL_04, '(', ''),')', ''),'-', ''),' ', '') as TEL_04,
    replace (replace (replace (replace (Telefone5, '(', ''),')', ''),'-', ''),' ', '') as [Telefone Residencial],
    nome_Cliente
FROM (SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.CPF,
    '' AS CNPJ,
    A.Id_Campanha,
    E.Id as IDCP,
    C.ID as Id_Contato,
    A.TEL_RESIDENCIAL  as TEL_01,
    A.TEL_COMERCIAL as TEL_02,
    A.Celular1 as TEL_03,
    A.Celular2 as TEL_04,
    A.Telefone5,
    c.name as nome_Cliente,
    row_number() over (partition by A.CPF order by C.ID desc) AS ROW_ID

FROM 
  Tb_Base_Prospect_OTC291_Online_Filtrada_AeC A 
  INNER JOIN Contact_Salesforce C on C.id = A.id_contato
  INNER JOIN ACCOUNT_SALESFORCE D on C.AccountId = D.ID
  INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce E ON A.CPF = E.CPF_CNPJ_Cliente__c
  WHERE E.HC_Id_Parceiro_Cap__c = 'TCBB' OR   E.HC_Id_Parceiro_Darwin__c = '1') BASE
WHERE ROW_ID = 1 
