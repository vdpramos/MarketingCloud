select c.id, c.hc_cpf_cnpj__c as CPF_CNPJ, hc_classificacao__c as classificacao, c.hc_cliente__c as id_cliente
from hc_relacao_cliente_parceiro__c_salesforce c
where hc_classificacao__c not in ('Cliente', 'Falecido', 'Funcionário')
and exists (select 1 from hc_titulo__c_salesforce t 
            where c.id = t.HC_Cliente_x_Parceiro__c
                and HC_Situacao__c in ('Ativo', 'Em processo de finalização', 'Em processo de Reativação', 'Suspenso'))