SELECT c.SubscriberKey, c.JobID, c.SubscriberID, c.URL, c.EventDate, 
IIF(c.IsUnique='True',1,0) AS IsUnique
FROM _Click c
WHERE
month(EventDate) = month(getdate()-1) 
and 
year(EventDate) = year(getdate()-1)