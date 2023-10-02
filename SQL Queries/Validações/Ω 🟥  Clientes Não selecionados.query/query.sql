select cpf.cpf, c.Contato_no_Marketing__c
from Contemplados_CPFs_Faltando cpf
inner join contact_salesforce c
    on cpf.cpf = c.hc_cpf_cnpj__c