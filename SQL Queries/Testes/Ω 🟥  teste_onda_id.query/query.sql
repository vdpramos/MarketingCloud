SELECT
Campanha,
CASE 
    WHEN Onda IS NULL THEN 1
    ELSE MAX(Onda) + 1
END AS ONDA,
GETDATE() AS Data
FROM
onda_id
WHERE
Campanha = '12345'
GROUP BY Campanha, Onda