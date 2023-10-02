SELECT
Nome,
CONCAT('55', REPLACE(REPLACE(Telefone, ' ', ''), '-', '')) AS Telefone,
CONCAT('55', REPLACE(REPLACE(Telefone, ' ', ''), '-', '')) AS ID,
'br' AS locale
FROM
Import_base_whatsapp