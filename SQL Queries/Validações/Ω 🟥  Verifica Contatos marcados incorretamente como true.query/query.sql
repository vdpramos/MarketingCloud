select HC_CPF_CNPJ__c, 'False' as Contato_no_Marketing__c
from contact_salesforce c
where Contato_no_Marketing__c = 1 
        and not exists(select 1 from CorteContatosMkt mkt where mkt.cpf_cnpj = HC_CPF_CNPJ__c)