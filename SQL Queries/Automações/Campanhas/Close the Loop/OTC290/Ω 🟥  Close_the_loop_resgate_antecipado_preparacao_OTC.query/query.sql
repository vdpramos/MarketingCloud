SELECT x.*
FROM
    (
    	SELECT *,
        	'Resgate Antecipado' AS Interacao,
        	ROW_NUMBER() OVER (PARTITION BY CPF_CNPJ ORDER BY Data_ultimo_resgate DESC) ranking
    	FROM Close_the_loop_resgate_antecipado
    	WHERE
        	Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_contemplados
        	)
        	AND Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_cancelados
        	)
        	AND Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_compradores
        	)
    ) x
WHERE
    x.ranking = 1