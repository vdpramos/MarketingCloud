SELECT 
	CPF_CNPJ,
	CONCAT('55', REPLACE(REPLACE(REPLACE(REPLACE(CELULAR, '(', ''), ')', ''), ' ', ''), '-', '')) AS CELULAR
FROM Tb_Campanha_Aniversariantes_Base
WHERE CELULAR_VALIDO = 1