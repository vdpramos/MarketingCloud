SELECT *
FROM Close_the_loop_preparacao_OTC_tratada
WHERE
    Nome IS NOT NULL
    AND
    Data_nascimento IS NOT NULL
    AND
    (
        Nao_importune = 0
        OR
        Nao_importune IS NULL
    )