select distinct  c.id, 
        c.cpf_cnpj, 
        c.nomecompleto, 
        t.HC_CPF_CNPJ_Titular__c as cpf_titular, 
        t1.HC_CPF_CNPJ_Subscritor__c as cpf_subscritor,
        t.hc_cliente__c as id_cliente
from ClienteParceiroSemClienteUnico c
left join hc_titulo__c_salesforce t
    on c.cpf_cnpj = t.HC_CPF_CNPJ_Titular__c
left join hc_titulo__c_salesforce t1
    on c.cpf_cnpj = t1.HC_CPF_CNPJ_Subscritor__c 
where not exists (select 1 from ClienteParceiroSemClienteUnicoSemTitulo t where c.cpf_cnpj = t.cpf_cnpj )
