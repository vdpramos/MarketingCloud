select pg.id, pa.name
from Pagamentos_AtualizaMeioCredito pa
inner join hc_pagamento__c_salesforce pg
    on pg.name = pa.name
