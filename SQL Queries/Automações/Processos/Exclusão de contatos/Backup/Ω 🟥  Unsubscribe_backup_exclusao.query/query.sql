SELECT
    a.SubscriberKey,
    b.AccountID,
    b.OYBAccountID,
    b.JobID,
    b.ListID,
    b.BatchID,
    b.SubscriberID,
    b.EventDate,
    b.IsUnique,
    b.Domain
FROM Exclusao_contatos a
    INNER JOIN _Unsubscribe b 
        ON a.SubscriberKey = b.SubscriberKey