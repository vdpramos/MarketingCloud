select CPF_CNPJ, PARCEIRO
from Cliente 
WHERE CONCAT(CPF_CNPJ, parceiro) 
        not in
            (select CONCAT(HC_CPF_CNPJ__c, HC_Id_Parceiro_Cap__c) 
             FROM HC_Relacao_Cliente_Parceiro__c_SALESFORCE
             WHERE HC_Origem__c = 'CAP'
                   AND HC_Classificacao__c <> 'Cliente Potencial')

