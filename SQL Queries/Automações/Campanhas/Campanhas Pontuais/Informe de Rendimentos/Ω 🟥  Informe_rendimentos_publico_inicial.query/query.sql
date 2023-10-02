SELECT
    a.MCI,
    b.HC_CPF_CNPJ__c AS CPF_CNPJ,
    b.Id AS Id_Cliente_Parceiro,
    c.HC_Data_Nascimento__c AS Data_Nascimento,
    d.Id AS Id_Contato,
    REPLACE(REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (c.Name, 'á', 'a'),'é', 'e'),'í', 'i'),'ó', 'o'),'ú', 'u'),'Á', 'A'),'É', 'E'),'Í', 'I'),'Ó', 'O'),'Ú', 'U'),'à', 'a'),'À', 'A'),'ã', 'a'),'õ', 'o'),'Ã', 'A'),  'Õ', 'O'),'â', 'a'),'ê', 'e'),'ô', 'o'),'Â', 'A'),'Ê', 'E'),'Ô', 'O'),'ç', 'c'),'Ç', 'c') , '-', '') , '+', '') , '|', '') , '$', '') , '%', '') , '&', '') , '¦', '') AS Nome,
    CASE 
        WHEN b.HC_Email_Brasilcap__c IS NOT NULL THEN b.HC_Email_Brasilcap__c
        WHEN b.HC_Email_Pessoal__c IS NOT NULL THEN b.HC_Email_Pessoal__c
        WHEN b.HC_Email_Comercial__c IS NOT NULL THEN b.HC_Email_Comercial__c
        ELSE NULL
    END AS Email,
    CASE
        WHEN b.HC_Celular_1__c IS NOT NULL THEN HC_Celular_1__c
        WHEN b.HC_Celular_2__c IS NOT NULL THEN HC_Celular_2__c
        WHEN b.HC_Celular_3__c IS NOT NULL THEN HC_Celular_3__c
        WHEN b.HC_Celular_3_3__c IS NOT NULL THEN HC_Celular_3_3__c
        WHEN b.HC_Celular_4__c IS NOT NULL THEN HC_Celular_4__c
        ELSE NULL
    END AS Celular
FROM BaseMCI a
    INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce b
        ON a.MCI = b.HC_MCI_BB_Cliente__c
    INNER JOIN Account_Salesforce c
        ON c.Id = b.HC_Cliente__c
    INNER JOIN Contact_Salesforce d
        ON d.AccountId = c.Id
WHERE
    c.HC_Data_Nascimento__c IS NOT NULL
    AND
    (
        (
        b.HC_Email_Brasilcap__c IS NOT NULL
        OR
        b.HC_Email_Pessoal__c IS NOT NULL
        OR
        b.HC_Email_Comercial__c IS NOT NULL
        )
    OR
        (
        HC_Celular_1__c IS NOT NULL
        OR
        HC_Celular_2__c IS NOT NULL
        OR
        HC_Celular_3__c IS NOT NULL
        OR
        HC_Celular_3_3__c IS NOT NULL
        OR
        HC_Celular_4__c IS NOT NULL
        )
    )
    AND
    c.Name IS NOT NULL