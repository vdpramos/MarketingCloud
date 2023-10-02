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
    b.URL,
    b.LinkName,
    b.LinkContent,
    b.IsUnique,
    b.TriggererSendDefinitionObjectID,
    b.TriggeredSendCustomerKey
FROM Exclusao_contatos a
    INNER JOIN _Click b 
        ON a.SubscriberKey = b.SubscriberKey