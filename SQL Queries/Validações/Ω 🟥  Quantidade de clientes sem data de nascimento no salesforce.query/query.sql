select HC_CPF_CNPJ_CLIENTE__C as CPF
from Account_salesforce 
where HC_Data_Nascimento__c is null 
        and HC_Tipo_de_Pessoa__c = 'PF'
        and Name <> 'NAO INFORMADO'