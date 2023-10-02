select pg.id, rc1.hc_cpf_cnpj__c as HC_CPF_CNPJ_do_Titulo__c
from hc_titulo__c_salesforce t1 
inner join hc_relacao_cliente_parceiro__c_salesforce rc1
    on rc1.id = t1.hc_subscritor__c
inner join hc_pagamento__c_salesforce pg
    on pg.hc_titulo__c = t1.id
where pg.HC_Status_do_Pagamento__c in ('Queda', 'Queda de Prévia', 'Queda de Pagamento Liquidado', 'Bloqueado')