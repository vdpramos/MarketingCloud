select  Name,
        HC_Status_do_Pagamento__c,
        RIGHT(REPLICATE ('0' , 12)+CONVERT(VARCHAR, HC_Numero_da_Conta_Corrente__c), 12) AS HC_Numero_da_Conta_Corrente__c,
        RIGHT(REPLICATE ('0' , 4)+CONVERT(VARCHAR, HC_Numero_da_Conta_Corrente__c), 4) AS HC_Numero_da_Agencia__c,
        HC_Meio_de_credito__c,
        id
from Pagamentos_AtualizaMeioCredito 
where id is not null 
        and id <> ''