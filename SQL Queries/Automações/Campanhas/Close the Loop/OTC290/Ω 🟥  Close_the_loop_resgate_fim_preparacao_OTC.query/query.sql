SELECT x.*
FROM
    (
    	SELECT *,
        	'Resgate Fim' AS Interacao,
        	ROW_NUMBER() OVER (PARTITION BY CPF_CNPJ ORDER BY Data_ultimo_resgate DESC) ranking
    	FROM Close_the_loop_resgate_fim
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
        	AND Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_resgate_antecipado
        	)
    ) x
WHERE
    x.ranking = 1