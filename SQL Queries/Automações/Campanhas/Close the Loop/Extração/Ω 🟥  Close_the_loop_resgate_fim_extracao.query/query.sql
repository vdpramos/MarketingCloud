SELECT *,
    (SELECT MAX(Onda) FROM Close_the_loop_controle_ondas) AS Onda
FROM Close_the_loop_OTC291_filtrada
WHERE
    Interacao = 'Resgate Fim'