select DESC_STATUS_PAGAMENTO, ID_PROPOSTA, ID_PAGAMENTO, ID_PLANO, DATA_ULT_AGENDAMENTO, d.HC_Status_do_Pagamento__c
from PagamentosQuedaCap p
inner join HC_Pagamento__c_SALESFORCE d
    on p.id_pagamento = d.name
where (p.DESC_STATUS_PAGAMENTO = 'Queda de previa' and d.HC_Status_do_Pagamento__c != 'Queda de Prévia')
        or (p.DESC_STATUS_PAGAMENTO = 'Queda' and d.HC_Status_do_Pagamento__c != 'Queda')                         