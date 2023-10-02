select id as ID, HC_CPF_CNPJ__c as CPF_CNPJ, HC_Id_Parceiro_Cap__c AS PARCEIRO
from HC_Relacao_Cliente_Parceiro__c_SALESFORCE 
WHERE HC_Origem__c = 'CAP' 
      AND HC_Classificacao__c <> 'Cliente Potencial'
      AND CONCAT(HC_CPF_CNPJ__c, HC_Id_Parceiro_Cap__c) NOT IN (SELECT CONCAT(cpf_cnpj, parceiro) FROM Cliente)
