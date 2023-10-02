SELECT
    a.SubscriberKey,
    b.AccountID,
    b.OYBAccountID,
    b.JobID,
    b.ListID,
    b.BatchID,
    b.SubscriberID,
    b.EventDate,
    b.Domain,
    b.TriggererSendDefinitionObjectID,
    b.TriggeredSendCustomerKey
FROM Exclusao_contatos a
    INNER JOIN _sent b 
        ON a.SubscriberKey = b.SubscriberKey