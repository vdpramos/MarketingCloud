SELECT
    sub.Id_contato,
    sub.Id_cliente_parceiro,
    sub.Nome,
    sub.Celular_1,
    sub.Celular_2,
    sub.Telefone_Brasilcap,
    sub.Telefone_comercial,
    sub.Nivel_relacionamento,
    sub.Tipo_pagamento,
    sub.UF,
    sub.Idade,
    sub.CPF_CNPJ,
    sub.Id_cliente
FROM
(
    SELECT 
    Id_contato,
    Id_cliente_parceiro,
    Nome,
    Celular_1,
    Celular_2,
    Telefone_Brasilcap,
    Telefone_comercial,
    Nivel_relacionamento,
    Tipo_pagamento,
    UF,
    Idade,
    CPF_CNPJ,
    Id_cliente,
    ROW_NUMBER() OVER (PARTITION BY Id_contato ORDER BY Id_titulo ASC) ranking
    FROM
    Close_the_loop_clientes_ativos_titulos
    WHERE
    Tipo_pagamento = 'PU'
) sub
WHERE
    sub.ranking = 1