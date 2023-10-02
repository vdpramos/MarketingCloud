SELECT
    a.SubscriberKey,
    b.MobileMessageTrackingID,
    b.EID,
    b.MID,
    b.Mobile,
    b.MessageID,
    b.KeywordID,
    b.CodeID,
    b.ConversationID,
    b.CampaignID,
    b.Sent,
    b.Delivered,
    b.Undelivered,
    b.Outbound,
    b.Inbound,
    b.CreateDateTime,
    b.ModifiedDateTime,
    b.ActionDateTime,
    b.MessageText,
    b.IsTest,
    b.MobileMessageRecurrenceID,
    b.ResponseToMobileMessageTrackingID,
    b.IsValid,
    b.InvalidationCode,
    b.SendID,
    b.SendSplitID,
    b.SendSegmentID,
    b.SendJobID,
    b.SendGroupID,
    b.SendPersonID,
    b.SubscriberID,
    b.SMSStandardStatusCodeId,
    b.Description,
    b.Name,
    b.ShortCode,
    b.SharedKeyword,
    b.Ordinal,
    b.FromName,
    b.JBActivityID,
    b.JBDefinitionID
FROM Exclusao_contatos a
    INNER JOIN _smsmessagetracking b 
        ON a.SubscriberKey = b.SubscriberKey