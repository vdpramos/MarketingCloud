SELECT j.JobID,
j.SchedTime,
j.SalesForceErrorSubscriberCount,
j.DeliveredTime,
j.PickupTime,
j.EmailName,
j.EmailSubject,
j.ModifiedDate
FROM [_Job] j
WHERE j.JobID IN (SELECT JobID FROM [_Sent] 
WHERE 
(
    month(EventDate) = month(getdate()-1) 
    and 
    year(EventDate) = year(getdate()-1)
    )
)