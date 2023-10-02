select t.id, tc.Data_Pagamento_Resgate 
from hc_titulo__c_salesforce t
inner join TitulosCAP_DtUltimoResgate tc
    on t.HC_Numero_do_Titulo__c = tc.id_titulo
    and t.HC_Serie__c = tc.id_serie
    and t.HC_Plano__c = tc.id_plano
where t.HC_Data_do_ultimo_resgate__c is null
      and t.hc_origem__c = 'CAP'