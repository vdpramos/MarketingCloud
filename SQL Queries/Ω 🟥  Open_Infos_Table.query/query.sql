SELECT o.SubscriberKey,
o.SubscriberID,
o.JobID,
o.EventDate,
IIF(o.IsUnique='True',1,0) AS IsUnique
FROM [_Open] o
WHERE
month(EventDate) = month(getdate()-1) 
and 
year(EventDate) = year(getdate()-1)