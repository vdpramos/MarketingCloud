SELECT top 10000
YEAR(CreateDateTime) AS ANO,
MONTH(CreateDateTime) AS MES,
(COUNT(*)*25) AS QTD_TOTAL_SMS
FROM _smsmessagetracking WITH(NOLOCK)
GROUP BY MONTH(CreateDateTime), YEAR(CreateDateTime)
ORDER BY YEAR(CreateDateTime) asc, MONTH(CreateDateTime) asc
