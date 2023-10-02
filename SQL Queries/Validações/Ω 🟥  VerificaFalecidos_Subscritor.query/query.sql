select id, hc_classificacao__c from hc_relacao_cliente_parceiro__c_salesforce cp
where cp.hc_classificacao__c = 'Falecido' and
        not exists(select 1 from hc_titulo__c_salesforce  t where cp.id = t.hc_subscritor__c and t.hc_situacao__c = 'Finalizado - Óbito')