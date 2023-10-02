select c.id, 'false' as HC_CustomerToBeDeleted_Flg__c
from HC_Relacao_Cliente_Parceiro__c_salesforce c
where HC_CustomerToBeDeleted_Flg__c = 'true'
and not exists (select 1 from clientesExpurgar ce where ce.id = c.id)