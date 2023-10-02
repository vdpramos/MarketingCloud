select id, 'Falecido' as hc_classificacao__c
from hc_relacao_cliente_parceiro__c_salesforce cxp
where exists (select 1 
                from hc_titulo__c_salesforce t 
                where cxp.id = t.HC_Cliente_x_Parceiro__c 
                      and t.hc_situacao__c = 'Finalizado - Óbito')
