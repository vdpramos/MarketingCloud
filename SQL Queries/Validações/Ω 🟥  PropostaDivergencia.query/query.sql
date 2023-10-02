select  ID_PROPOSTA,  ID_PLANO
from Propostas p
where   not exists (select 1 from HC_Proposta__c_SALESFORCE d
                        where p.id_proposta = d.Name
                        and p.id_plano = d.HC_Codigo_do_Produto__c)
                        