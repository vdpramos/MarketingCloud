SELECT
    rtrim(left(coalesce(CAST(A.Dt_Atualizacao as char(255)),'<null>'), 255)) as Dt_Atualizacao from Tb_Base_Nao_Importune A
WHERE
    A.Dt_Atualizacao = '20220115'