select concat(r.HC_CPF_CNPJ__c, r.HC_Id_Parceiro_Cap__c) as CPF_CNPJ_PARCEIRO
from Case_salesforce c
inner join HC_Relacao_Cliente_Parceiro__c_Salesforce r
    on c.HC_Relacao_Cliente_x_Parceiro__c = r.id
where c.HC_Categoria__c = 'Reclamação' 
	  or (c.HC_Ponto_de_Contato__c = 'Ouvidoria Brasilcap')