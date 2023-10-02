select  HC_CPF_CNPJ__c as HC_CPF_CNPJ_Cliente__c, 
        HC_Tipo_de_Pessoa__c, 
        Name, 
        Data_de_Nascimento__c as HC_Data_de_Nascimento__c
from hc_relacao_cliente_parceiro__c_salesforce 
where hc_cliente__c is null
       and name not like ('a0i6g%') 