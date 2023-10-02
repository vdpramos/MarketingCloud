SELECT
    CPF_CNPJ,
    Id_Contato,
    Id_Cliente_Parceiro,
    Nome,
    Data_Nascimento,
    Email,
    Celular,
    MCI,
    Tipo_Carteira,
    Encarteiramento,
        CASE
            WHEN LEN(CPF_CNPJ) = 11 THEN 'PF'
            WHEN LEN(CPF_CNPJ) = 14 THEN 'PJ'
        END AS Tipo_Pessoa
FROM Informe_Rendimentos_OTC291_filtrada