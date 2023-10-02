SELECT c.SubscriberKey, j.EmailName AS Campanha, COUNT(c.EventDate) AS Qtde_Clicks, c.JobID AS JobID
FROM CLICK_INFOS c
LEFT JOIN [_Job] j
ON j.JobID=c.JobID
GROUP BY c.SubscriberKey, j.EmailName, c.JobID
ORDER BY j.EmailName
OFFSET 0 ROWS
 
 