SELECT 'Cliente' as HC_Tipo_de_Relacionamento__c, 
a.Id as accountid, 
a.Name, 
a.HC_CPF_CNPJ_Cliente__c, 
a.HC_Tipo_de_Pessoa__c
FROM Account_salesforce a
inner join ClienteUnicoSemContato c
    on a.id = c.accountId