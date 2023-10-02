SELECT c.ID, c.HC_CustomerToBeDeleted_Flg__c
from HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE c
WHERE c.HC_CustomerToBeDeleted_Flg__c = 'true'
      and not exists(select 1 from ClientesExpurgar cs where cs.id = c.id)
