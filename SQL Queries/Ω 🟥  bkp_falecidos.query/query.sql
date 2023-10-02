select f.cpf, rc.hc_classificacao__c 
from FalecidosCAP f
inner join hc_relacao_cliente_parceiro__c_salesforce rc
    on f.cpf = rc.HC_CPF_CNPJ_Codigo_Parceiro_CAP__c