select be.cpf_cnpj, max(t.HC_Data_do_ultimo_resgate__c) AS ultimo_resgate
from Tb_Base_Ex_Cliente_ComOTC_Filtrada_TMKT be
inner join hc_titulo__c_salesforce t
    on be.cpf_cnpj = HC_CPF_CNPJ_Titular__c
group by CPF_CNPJ