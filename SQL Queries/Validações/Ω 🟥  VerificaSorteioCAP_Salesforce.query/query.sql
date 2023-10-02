select D.ID_TITULO, D.ID_SERIE, D.ID_PLANO, D.DATA_SORTEIO, TS.ID as ID_TITULO_SALESFORCE
from DatasSorteioCAP_1 D
INNER join HC_TITULO__C_SALESFORCE TS
    ON D.ID_TITULO = TS.HC_Numero_do_Titulo__c
        AND D.ID_SERIE = TS.HC_Serie__c
        AND D.ID_PLANO = TS.HC_Plano__c
WHERE   TS.HC_Data_da_Ultima_Contemplacao__c IS NULL
        