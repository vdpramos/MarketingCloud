select id, c.status 
from CorrecaoStatusPropostas c
inner join hc_proposta__c_salesforce p
    on ltrim(rtrim(p.Name)) =  ltrim(rtrim(c.id_proposta))
    and ltrim(rtrim(p.HC_Codigo_do_Produto__c)) =  ltrim(rtrim(c.id_plano))
where c.status <> p.hc_situacao__c