SELECT
    a.Id_contato,
    a.Nome,
    a.Celular_1,
    a.Celular_2,
    a.Celular_3,
    a.Telefone_Brasilcap,
    a.Telefone_comercial,
    a.Email,
    a.Nivel_Relacionamento,
    a.Tipo_pagamento,
    a.UF,
    a.Idade,
    a.Interacao
FROM Close_the_loop_OTC291_tratada a
/* CHECAGEM SE TOODS OS CONTATOS TIVERAM O OTC TRATADO */
    LEFT OUTER JOIN ( 
      SELECT
        COUNT(1) as CPFS_FALTANDO_NO_OTC
      FROM Close_the_loop_preparacao_OTC_filtrada ENV
        LEFT JOIN Close_the_loop_OTC291_tratada RET 
            ON ENV.CPF_CNPJ = RET.CPF
      WHERE RET.CPF IS NULL 
    ) b ON 1 = 1
    INNER JOIN Close_the_loop_preparacao_OTC_filtrada c 
        ON c.CPF_CNPJ = a.CPF
WHERE b.CPFS_FALTANDO_NO_OTC = 0
/* SIGNIFICA QUE TODOS OS CONTATOS JÁ ESTÃO NO OTC291 */