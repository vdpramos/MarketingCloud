SELECT
    a.Codigo_Parceiro,
    a.Codigo_MCI,
    a.Tipo_Pessoa,
    a.Codigo_CIC,
    a.Dt_Nascimento,
    a.Codigo_RNA,
    a.Valor_Rendimentos,
    a.Tipo_Carteira,
    CASE
        WHEN a.Nivel_Relacionamento = 2012 THEN 'PFA'
        WHEN a.Nivel_Relacionamento = 2112 THEN 'PFB'
        WHEN a.Nivel_Relacionamento IN (2602,2202) THEN 'PFC'
        WHEN a.Nivel_Relacionamento IN (2702,2302) THEN 'PFD'
        WHEN a.Nivel_Relacionamento = 2712 THEN 'PFE'
        ELSE 'OUTROS'
    END AS Nivel_Relacionamento,
    a.Data_Informacao,
    a.Filler2,
    a.CPF,
    a.Dt_Nascimento_SF,
    a.Alta_Renda,
    b.Id_contato,
    b.Nome,
    b.Celular_1,
    b.Celular_2,
    b.Celular_3,
    b.Telefone_Brasilcap,
    b.Telefone_comercial,
    b.Email,
    b.Tipo_pagamento,
    b.UF,
    b.Idade,
    b.Interacao
FROM Tb_Base_OTC291_Tratada a
    INNER JOIN Close_the_loop_preparacao_OTC_filtrada b 
        ON a.CPF = b.CPF_CNPJ