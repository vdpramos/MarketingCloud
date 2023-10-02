select id, pi.name 
from TrataPagamentoImportIncorretamente pi
inner join hc_pagamento__c_salesforce pg
    on pg.hc_proposta__c = pi.hc_proposta__c
where pg.name like 'a0V6g%' 