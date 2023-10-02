SELECT
    b.Id AS Id_contato,
    REPLACE(REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (b.Name, 'á', 'a'),'é', 'e'),'í', 'i'),'ó', 'o'),'ú', 'u'),'Á', 'A'),'É', 'E'),'Í', 'I'),'Ó', 'O'),'Ú', 'U'),'à', 'a'),'À', 'A'),'ã', 'a'),'õ', 'o'),'Ã', 'A'),  'Õ', 'O'),'â', 'a'),'ê', 'e'),'ô', 'o'),'Â', 'A'),'Ê', 'E'),'Ô', 'O'),'ç', 'c'),'Ç', 'c') , '-', '') , '+', '') , '|', '') , '$', '') , '%', '') , '&', '') , '¦', '') AS Nome,
    b.HC_CPF_CNPJ__c as CPF_CNPJ,
    c.Id AS Id_cliente,
    d.Id AS Id_cliente_parceiro,
    d.HC_Celular_1__c AS Celular_1,
    d.HC_Celular_2__c AS Celular_2,
    d.HC_Idade__c AS Idade,
    e.Id AS Id_titulo,
    e.HC_Tipo_de_pagamento__c AS Tipo_pagamento
FROM HC_Titulo__c_Salesforce e
    INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce d
        ON d.Id = e.HC_Subscritor__c /*e.HC_Cliente_x_Parceiro__c*/
    INNER JOIN Campaign_Salesforce a
        ON 1 = 1
    INNER JOIN Account_Salesforce c
        ON c.Id = d.HC_Cliente__c
    INNER JOIN Contact_Salesforce b
        ON b.AccountId = c.Id 
WHERE
    a.Id = '7016g000000NhziAAC'
    AND
    a.IsActive = 1
    AND
    (
        e.HC_Situacao__c = 'Ativo'
        OR
        e.HC_Situacao__c = 'Em processo de finalização'
        OR
        e.HC_Situacao__c = 'Em processo de Reativação'
        OR
        e.HC_Situacao__c = 'Pendente - Solicitação em andamento'
        OR
        e.HC_Situacao__c = 'Suspenso'
    )
    /* MOMENTO DE EXECUÇÃO DA CAMPANHA */
    /* AND 
    CONVERT(VARCHAR(10), a.HC_Data_de_Execucao__c, 101) = CONVERT(VARCHAR(10), GETDATE(), 101)
    AND 
    DATEPART(HH, a.HC_Data_de_Execucao__c) = DATEPART(HH, GETDATE())
    AND 
    b.HC_Tipo_de_Relacionamento__c = 'Cliente' */
    
    