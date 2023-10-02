SELECT A.CPF, B.Id AS Id_Contato, b.accountId as Id_conta
FROM Tb_Base_Prospect_OTC291_Online_Filtrada_AeC A 
JOIN [Contact_Salesforce] B 
ON A.CPF = B.hc_cpf_cnpj__c