SELECT
    a.SubscriberKey,
    b.SubscriberID,
    b.DateUndeliverable,
    b.DateJoined,
    b.DateUnsubscribed,
    b.Domain,
    b.EmailAddress,
    b.BounceCount,
    b.SubscriberType,
    b.Status,
    b.Locale
FROM Exclusao_contatos a
    INNER JOIN _Subscribers b 
        ON a.SubscriberKey = b.SubscriberKey