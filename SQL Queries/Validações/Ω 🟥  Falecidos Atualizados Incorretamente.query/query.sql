select  b.cpf as HC_CPF_CNPJ__C,
        concat(b.cpf, a.parceiro_cap) as HC_CPF_CNPJ_PARCEIRO_ORIGEM__C, 
        b.hc_classificacao__c, 
        c.id
from 	FalecidosAssociadosIncorretamente a
inner join bkp_Falecidos b
    on b.cpf = RIGHT(REPLICATE ('0' , 11)+CONVERT(VARCHAR, a.cpf), 11) 
inner join hc_relacao_cliente_parceiro__c_salesforce c
    on concat(b.cpf, a.parceiro_cap) = c.HC_CPF_CNPJ_Codigo_Parceiro_CAP__c
where c.hc_classificacao__c = 'Falecido'