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
    b.Domain,
    b.BounceCategoryID,
    b.BounceCategory,
    b.BounceSubcategoryID,
    b.BounceSubcategory,
    b.BounceTypeID,
    b.BounceType,
    b.SMTPBounceReason,
    b.SMTPMessage,
    b.SMTPCode,
    b.TriggererSendDefinitionObjectID,
    b.TriggeredSendCustomerKey
FROM Exclusao_contatos a
    INNER JOIN _bounce b 
        ON a.SubscriberKey = b.SubscriberKey