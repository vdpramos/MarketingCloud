select  t.id as id_titulo, 
        t.HC_Cliente_x_Parceiro__c as id_titular, 
        t.HC_Subscritor__c as id_subscritor, 
        cp.id as id_clienteParceiro,
        t.HC_Numero_do_Titulo__c as num_titulo,  
        t.HC_Serie__c as serie, 
        t.HC_Plano__c as plano, 
        t.HC_Origem__c as origem, 
        t.HC_Titulo__c as id_titulo_darwin
from hc_titulo__c_salesforce t
inner join hc_relacao_cliente_parceiro__c_salesforce cp   
        on t.HC_CPF_CNPJ_Titular__c = cp.HC_CPF_CNPJ__c
        and (   t.HC_Codigo_do_Parceiro_na_Origem__c = cp.HC_Id_Parceiro_Cap__c 
                or t.HC_Codigo_do_Parceiro_na_Origem__c = cp.HC_Id_Parceiro_Darwin__c )
where t.HC_Cliente_x_Parceiro__c is null