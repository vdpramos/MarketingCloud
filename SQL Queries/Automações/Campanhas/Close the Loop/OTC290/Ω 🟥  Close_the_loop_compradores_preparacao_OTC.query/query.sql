SELECT x.*
FROM
    (
    	SELECT *,
        	'Compradores' AS Interacao,
        	ROW_NUMBER() OVER (PARTITION BY CPF_CNPJ ORDER BY Inicio DESC) ranking
    	FROM Close_the_loop_compradores
    	WHERE
        	Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_contemplados
        	)
        	AND Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_cancelados
        	)
    ) x
WHERE
    x.ranking = 1