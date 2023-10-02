select a.*, c.hc_cpf_cnpj__c as CPF
from Close_the_loop_resgate_fim_extracao a
inner join contact_salesforce c
    on c.id = a.id_contato