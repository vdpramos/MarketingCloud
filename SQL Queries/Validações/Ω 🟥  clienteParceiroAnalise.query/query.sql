select id, month(createddate) as mes, createddate 
from hc_relacao_cliente_parceiro__c_salesforce 
where hc_cliente__c is null 