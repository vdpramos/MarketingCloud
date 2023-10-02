SELECT
    a.SubscriberKey,
    b.LogDate,
    b.MobileSubscriptionID,
    b.SubscriptionDefinitionID,
    b.MobileNumber,
    b.OptOutStatusID,
    b.OptOutMethodID,
    b.OptOutDate,
    b.OptInStatusID,
    b.OptInMethodID,
    b.OptInDate,
    b.Source,
    b.CreatedDate,
    b.ModifiedDate
FROM Exclusao_contatos a
    INNER JOIN _SMSSubscriptionLog b 
        ON a.SubscriberKey = b.SubscriberKey