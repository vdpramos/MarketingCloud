select bkp.id, CLASSIFICACAO as HC_Classificacao__c 
from ProspectsClassificadosIncorretamente_BackupInicial bkp
inner join hc_relacao_cliente_parceiro__c_salesforce cp
    on bkp.id = cp.id
where bkp.classificacao in ('Falecido', 'Funcionário')
      and bkp.classificacao <> cp.hc_classificacao__c

union all

select bkp.id, CLASSIFICACAO as HC_Classificacao__c 
from ClienteClassificadoIncorretamente_BackupInicial bkp
inner join hc_relacao_cliente_parceiro__c_salesforce cp
    on bkp.id = cp.id
where bkp.classificacao in ('Falecido', 'Funcionário')
      and bkp.classificacao <> cp.hc_classificacao__c
