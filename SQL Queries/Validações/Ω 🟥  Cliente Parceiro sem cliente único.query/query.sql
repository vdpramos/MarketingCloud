select id, HC_CPF_CNPJ__c as cpf_cnpj, Name as NomeCompleto, HC_Id_Parceiro_Cap__c as parceiro
from hc_relacao_cliente_parceiro__c_salesforce 
where hc_cliente__c is null