SELECT 
	CPF_CNPJ,
	CONCAT('55', REPLACE(REPLACE(REPLACE(REPLACE(CELULAR, '(', ''), ')', ''), ' ', ''), '-', '')) AS CELULAR
FROM Tb_Campanha_FimdeAno2021_Base
WHERE CELULAR_VALIDO = 1