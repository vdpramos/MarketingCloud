select top 1  c.id, 'Cliente' as hc_classificacao__c, c.hc_classificacao__c as hc_classificacao__c_old
from hc_relacao_cliente_parceiro__c_salesforce c
where hc_classificacao__c not in ('Cliente', 'Falecido', 'Funcionário')
and exists (select 1 from hc_titulo__c_salesforce t 
            where c.id = t.HC_Cliente_x_Parceiro__c
                and HC_Situacao__c in ('Ativo', 'Em processo de finalização', 'Em processo de Reativação', 'Suspenso'))
                
union 

select top 1 c.id, 'Ex-Cliente' as hc_classificacao__c, hc_classificacao__c as hc_classificacao__c_old
from hc_relacao_cliente_parceiro__c_salesforce c
where hc_classificacao__c not in ('Ex-Cliente', 'Falecido', 'Funcionário')
and not exists (select 1 from hc_titulo__c_salesforce t 
            where c.id = t.HC_Cliente_x_Parceiro__c
                and HC_Situacao__c in ('Ativo', 'Em processo de finalização', 'Em processo de Reativação', 'Suspenso'))
and exists (select 1 from hc_titulo__c_salesforce t 
            where c.id = t.HC_Cliente_x_Parceiro__c
                and HC_Situacao__c not in ('Ativo', 'Em processo de finalização', 'Em processo de Reativação', 'Suspenso'))
                
union

select top 1 c.id, 'Cliente Potencial' as hc_classificacao__c, hc_classificacao__c as hc_classificacao__c_old
from hc_relacao_cliente_parceiro__c_salesforce c
where hc_classificacao__c not in ('Prospect', 'Cliente Potencial', 'Falecido', 'Funcionário')
and not exists (select 1 
                    from hc_titulo__c_salesforce t 
                    where c.id = t.HC_Cliente_x_Parceiro__c)
                    
union 
    
select top 1 id, 'Falecido' as hc_classificacao__c, hc_classificacao__c as hc_classificacao__c_old
from hc_relacao_cliente_parceiro__c_salesforce cxp
where exists (select 1 
                from hc_titulo__c_salesforce t 
                where cxp.id = t.HC_Cliente_x_Parceiro__c 
                      and t.hc_situacao__c = 'Finalizado - Óbito')
                      