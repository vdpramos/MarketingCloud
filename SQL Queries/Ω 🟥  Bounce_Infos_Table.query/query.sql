SELECT SubscriberKey, JobID, EventDate, BounceCategory, BounceType
FROM [_Bounce]
WHERE
month(EventDate) = month(getdate()-1) 
and 
year(EventDate) = year(getdate()-1)