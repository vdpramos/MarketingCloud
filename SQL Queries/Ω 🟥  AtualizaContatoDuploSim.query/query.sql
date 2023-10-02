select c.id as id_contato, 
       p.cpf_cnpj
from contact_salesforce c
inner join  PublicoAlvoDuploSim p
    on p.CPF_CNPJ = c.hc_cpf_cnpj__c