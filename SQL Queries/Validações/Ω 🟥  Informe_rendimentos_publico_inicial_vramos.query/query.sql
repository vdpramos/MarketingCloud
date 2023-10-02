SELECT
    b.HC_CPF_CNPJ__c, 
    'True' as Contato_no_Marketing__c
FROM BaseMCI a
    INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce b
        ON a.MCI = b.HC_MCI_BB_Cliente__c
    INNER JOIN Account_Salesforce c
        ON c.Id = b.HC_Cliente__c
    LEFT JOIN Contact_Salesforce d
        ON d.AccountId = c.Id
WHERE
    b.Name IS  NULL