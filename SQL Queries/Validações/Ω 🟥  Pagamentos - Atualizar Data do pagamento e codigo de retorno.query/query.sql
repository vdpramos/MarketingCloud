SELECT  PG.ID, 
        PQ.COD_RETORNO AS HC_Codigo_de_Retorno_de_Erro__c, 
        PQ.DATA_ULT_AGENDAMENTO AS HC_Data_do_pagamento__c
FROM PagamentosQuedaCap PQ
INNER JOIN HC_PAGAMENTO__C_SALESFORCE PG
    ON PG.NAME = PQ.ID_PAGAMENTO
WHERE PG.HC_Codigo_de_Retorno_de_Erro__c IS NULL