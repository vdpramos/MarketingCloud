SELECT
    CASE 
        WHEN COUNT(*) = 0 THEN 1
        ELSE MAX(Onda) + 1
    END AS ONDA
FROM Close_the_loop_controle_ondas