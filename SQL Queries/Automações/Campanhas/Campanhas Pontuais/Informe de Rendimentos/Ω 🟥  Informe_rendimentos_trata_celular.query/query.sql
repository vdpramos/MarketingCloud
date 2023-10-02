SELECT
    CPF_CNPJ,
    Id_Contato,
    Id_Cliente_Parceiro,
    MCI,
    CONCAT('55', REPLACE(REPLACE(REPLACE(REPLACE(Celular, '(', ''), ')', ''), ' ', ''), '-', '')) AS Celular
FROM Informe_rendimentos_publico_inicial
WHERE
    Celular IS NOT NULL