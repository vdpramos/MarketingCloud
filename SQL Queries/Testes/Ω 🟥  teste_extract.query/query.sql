SELECT *,
(SELECT MAX(Onda) FROM teste_onda) AS Onda
FROM
teste_email
WHERE
email != 'email@6'