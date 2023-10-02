SELECT
    a.Codigo_Parceiro,
    a.Codigo_MCI,
    a.Tipo_Pessoa,
    a.Codigo_CIC,
    a.Dt_Nascimento,
    a.Codigo_RNA,
    a.Valor_Rendimentos,
    a.Tipo_Carteira,
    a.Nivel_Relacionamento,
    a.Data_Informacao,
    a.Filler2,
    a.CPF,
    a.Dt_Nascimento_SF,
    a.Alta_Renda,
    b.Id_Contato,
    b.Nome,
    b.Id_Cliente_Parceiro,
    b.Email,
    b.Celular,
    b.MCI
FROM Tb_Base_OTC291_Tratada a
    INNER JOIN Informe_rendimentos_publico_inicial b 
        ON a.CPF = b.CPF_CNPJ