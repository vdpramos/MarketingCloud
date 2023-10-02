select distinct rtrim(left(coalesce(CAST(vp.id_proposta as char(255)),'<null>'), 255)) as id_proposta, rtrim(left(coalesce(CAST(vp.id_plano as char(255)),'<null>'), 255)) as id_plano, rtrim(left(coalesce(CAST(o.HC_Valor_Total__c as char(255)),'<null>'), 255)) as HC_Valor_Total__c, rtrim(left(coalesce(CAST(o.CampaignId as char(255)),'<null>'), 255)) as CampaignId, rtrim(left(coalesce(CAST(p.name as char(255)),'<null>'), 255)) as name from ValidaProposta vp

 inner join opportunity_salesforce o
 on o.HC_Numero_da_Proposta__c = vp.id_proposta
 
 inner join Campaign_salesforce p
on p.id = o.CampaignId

 where o.hc_numero_da_proposta__c is not null
 