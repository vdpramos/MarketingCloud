SELECT x.*
FROM
    (
    	SELECT *,
        	'Cancelados' AS Interacao,
        	ROW_NUMBER() OVER (PARTITION BY CPF_CNPJ ORDER BY Inicio DESC) ranking
    	FROM Close_the_loop_cancelados
    	WHERE
        	Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_contemplados
        	)
    ) x
WHERE
    x.ranking = 1