select acc.id 
from account_salesforce acc
where not exists (select 1 from hc_titulo__c_salesforce t where acc.hc_cpf_cnpj_cliente__c = t.HC_CPF_CNPJ_Titular__c )
    and not exists (select 1 from hc_titulo__c_salesforce t where acc.hc_cpf_cnpj_cliente__c = t.HC_CPF_CNPJ_Subscritor__c )
    and not exists (select 1 from hc_titulo__c_salesforce t where acc.id = t.HC_cliente__c )
    and not exists (select 1 from hc_proposta__c_salesforce pp where acc.hc_cpf_cnpj_cliente__c = pp.HC_CPF_CNPJ_Titular__c)
    and not exists (select 1 from hc_proposta__c_salesforce pp where acc.hc_cpf_cnpj_cliente__c = pp.HC_CPF_CNPJ_Subscritor__c)
    and not exists (select 1 from hc_relacao_cliente_parceiro__c_salesforce cp where acc.hc_cpf_cnpj_cliente__c = cp.HC_CPF_CNPJ__c)
    and not exists (select 1 from hc_relacao_cliente_parceiro__c_salesforce cp where acc.id = cp.HC_Cliente__c)
    /* and not exists (select 1 from contact_salesforce c where acc.id = c.accountid)*/
    
    
    