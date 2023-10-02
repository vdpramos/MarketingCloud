SELECT DISTINCT st.JobID AS JobID,
st.EventDate AS EventDate,
ac.HC_Data_Nascimento__c AS Data_Nascimento,
st.SubscriberKey AS SubscriberKey, 
ac.HC_CPF_CNPJ_Cliente__c AS CPF, 
ac.Id AS Id_Contato, 
st.TriggererSendDefinitionObjectID AS TriggererSendDefinitionObjectID
FROM [_Sent] st
LEFT JOIN Contact_Salesforce cs
ON st.SubscriberKey=cs.ID
LEFT JOIN Account_Salesforce ac
ON cs.HC_CPF_CNPJ__c=ac.HC_CPF_CNPJ_Cliente__c
WHERE
month(EventDate) = month(getdate()-1) 
and 
year(EventDate) = year(getdate()-1)