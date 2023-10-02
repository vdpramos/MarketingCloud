select  t.id as id_titulo, 
        t.HC_Cliente_x_Parceiro__c as id_titular, 
        t.HC_Subscritor__c as id_subscritor, 
        acc.id as id_cliente,
        t.HC_Numero_do_Titulo__c as num_titulo,  
        t.HC_Serie__c as serie, 
        t.HC_Plano__c as plano, 
        t.HC_Origem__c as origem, 
        t.HC_Titulo__c as id_titulo_darwin
from hc_titulo__c_salesforce t
left join account_salesforce acc   
        on t.HC_CPF_CNPJ_Titular__c = acc.HC_CPF_CNPJ_Cliente__c
where /*t.HC_Cliente_x_Parceiro__c is null or t.HC_Subscritor__c is null or */
        acc.id is not null and t.HC_Cliente__c is null