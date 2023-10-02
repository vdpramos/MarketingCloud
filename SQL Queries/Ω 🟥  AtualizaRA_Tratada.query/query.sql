select id, 1 as HC_renovacao_automatica__c 
from hc_titulo__c_salesforce 
inner join AtualizaRA RA
    ON hc_proposta__c = RA.id_proposta
