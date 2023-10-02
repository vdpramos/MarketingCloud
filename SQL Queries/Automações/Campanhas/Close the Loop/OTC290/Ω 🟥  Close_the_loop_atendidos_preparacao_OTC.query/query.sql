SELECT x.*
FROM
    (
    	SELECT *,
        	'Atendimento' AS Interacao,
        	ROW_NUMBER() OVER (PARTITION BY CPF_CNPJ ORDER BY Data_abertura DESC) ranking
    	FROM Close_the_loop_atendidos
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
        	AND Id_contato NOT IN (
        		SELECT Id_contato FROM Close_the_loop_resgate_fim
        	)
    ) x
WHERE
    x.ranking = 1