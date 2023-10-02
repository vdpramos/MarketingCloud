select A.ID, d.CPF, d.NOME, d.DATA_NASCIMENTO, d.SEXO 
from DataNascimentoDar d
inner join account_SALESFORCE a
    on d.CPF = a.HC_CPF_CNPJ_Cliente__c
where d.DATA_NASCIMENTO <> A.HC_Data_Nascimento__c