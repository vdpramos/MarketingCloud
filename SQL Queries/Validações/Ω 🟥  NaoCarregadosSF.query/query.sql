select cpf.cpf as name, c.hc_cliente__c
from Contemplados_CPFs_Faltando cpf
inner join hc_relacao_cliente_parceiro__c_salesforce c
    on cpf.cpf = c.hc_cpf_cnpj__c
where not exists (select 1 from ContatosNaoSelecionados cns where cpf.cpf = cns.cpf)
