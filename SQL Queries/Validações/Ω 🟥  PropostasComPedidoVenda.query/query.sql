SELECT vp.id_proposta, vp.id_plano, o.id as id_oportunidade
FROM ValidaProposta vp
inner join hc_titulo__c_salesforce t
    on t.hc_proposta__c = vp.id_proposta
inner join opportunity_salesforce o
    on o.id = t.HC_Pedido_de_Venda__c
where o.id is not null