select cp.HC_CPF_CNPJ__c, 'true' as Contato_no_Marketing__c 
from hc_relacao_cliente_parceiro__c_salesforce cp
where cp.hc_classificacao__c = 'Cliente'
        and (HC_chaveParceiro__c = 52 or HC_Chave_Parceiro__c = 52)
        and not exists( select 1 from contact_salesforce c 
                        where c.HC_CPF_CNPJ__c = cp.hc_cpf_cnpj__c 
                                and c.HC_Tipo_de_Relacionamento__c = 'Cliente')

