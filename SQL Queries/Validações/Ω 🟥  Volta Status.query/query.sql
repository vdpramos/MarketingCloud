select st.id, st.HC_SITUACAO__C 
from Backup_status_titulos_20230623 st
inner join hc_titulo__c_salesforce ti
    on ti.id = st.id
where ti.LastModifiedById = '0056g000004vdnQAAQ'
    and ti.HC_SITUACAO__C = st.HC_SITUACAO__C