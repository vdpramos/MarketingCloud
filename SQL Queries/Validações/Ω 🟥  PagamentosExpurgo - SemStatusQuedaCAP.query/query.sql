select ID, NAME, d.HC_Status_do_Pagamento__c, d.createddate, d.LastModifiedDate
from HC_Pagamento__c_SALESFORCE d
where   D.HC_Origem__c = 'CAP' 
        AND not exists (select 1 from PagamentosQuedaCap p
                   where p.id_pagamento = d.name)
        AND D.HC_Status_do_Pagamento__c in ('Queda', 'Queda de Prévia', 'Bloqueado')
        AND not exists (select 1 from Pagamento_do_Caso__c_salesforce pc
                    where d.id = pc.Pagamento__c)