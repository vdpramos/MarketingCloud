select CPF_CNPJ, 'X' as Classificacao 
from BaseSusep_Enriquecimento ssp
where exists (  select 1 from hc_titulo__c_salesforce t 
                inner join hc_relacao_cliente_parceiro__c_salesforce rc
                    on rc.id = t.hc_subscritor__c
                where HC_Situacao__c in ('Ativo', 'Em processo de finalização', 'Em processo de Reativação', 'Suspenso')
                      and RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, ssp.cpf_cnpj), 15) =  RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, rc.hc_cpf_cnpj__c), 15))
        or exists ( select 1 from hc_titulo__c_salesforce t1 
                    inner join hc_relacao_cliente_parceiro__c_salesforce rc1
                        on rc1.id = t1.hc_subscritor__c
                    inner join hc_pagamento__c_salesforce pg
                        on pg.hc_titulo__c = t1.id
                    where  RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, ssp.cpf_cnpj), 15) =  RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, rc1.hc_cpf_cnpj__c), 15) 
                           and pg.HC_Status_do_Pagamento__c in ('Queda', 'Queda de Prévia', 'Queda de Pagamento Liquidado', 'Bloqueado'))