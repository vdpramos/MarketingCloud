select d.id, t.hc_situacao__c
from TitulosDarwin T
inner join HC_Titulo__c_SALESFORCE d
    on rtrim(ltrim(t.id_titulo))  = d.hc_titulo__c
    and rtrim(ltrim(t.hc_situacao__c)) <> rtrim(ltrim(d.hc_situacao__c))
Where 
    d.hc_origem__c = 'Darwin'