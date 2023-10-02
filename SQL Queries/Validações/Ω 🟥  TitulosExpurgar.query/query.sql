select distinct d.id
from HC_Titulo__c_SALESFORCE d
where d.HC_Origem__c = 'CAP' and
      not exists (select 1 from TitulosCAP_1 t
                        where rtrim(ltrim(t.id_titulo))  = d.HC_Numero_do_Titulo__c
                        and rtrim(ltrim(t.id_plano)) = rtrim(ltrim(d.HC_Plano__c))
                        and rtrim(ltrim(t.id_serie)) = rtrim(ltrim(d.HC_Serie__c)))