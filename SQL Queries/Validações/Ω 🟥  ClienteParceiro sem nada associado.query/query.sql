select id, cpf_cnpj, NomeCompleto
from ClienteParceiroSemClienteUnico aux
where not exists (select 1 from hc_titulo__c_salesforce t where aux.cpf_cnpj = t.HC_CPF_CNPJ_Titular__c )
and not exists (select 1 from hc_titulo__c_salesforce t where aux.cpf_cnpj = t.HC_CPF_CNPJ_Subscritor__c )
and not exists (select 1 from hc_titulo__c_salesforce t where aux.id = t.HC_cliente__c )
and not exists (select 1 from account_salesforce a where aux.cpf_cnpj = a.HC_CPF_CNPJ_Cliente__c)
and not exists (select 1 from hc_proposta__c_salesforce pp where aux.cpf_cnpj = pp.HC_CPF_CNPJ_Subscritor__c)
and not exists (select 1 from hc_proposta__c_salesforce pp where aux.cpf_cnpj = pp.HC_CPF_CNPJ_Titular__c)