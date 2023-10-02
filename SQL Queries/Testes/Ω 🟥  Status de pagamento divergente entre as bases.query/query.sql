select DESC_STATUS_PAGAMENTO, ID_PROPOSTA, ID_PAGAMENTO, ID_PLANO, DATA_ULT_AGENDAMENTO
from PagamentosQuedaCap p
where   exists (select 1 from HC_Pagamento__c_SALESFORCE d
                        where p.id_pagamento = d.name
                        and p.DESC_STATUS_PAGAMENTO != d.HC_Status_do_Pagamento__c)
                        