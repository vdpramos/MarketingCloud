select acc.id
from account_salesforce acc
where not exists(select 1 from hc_relacao_cliente_parceiro__c_salesforce cp 
                 where acc.HC_CPF_CNPJ_Cliente__c = cp.HC_CPF_CNPJ__c)