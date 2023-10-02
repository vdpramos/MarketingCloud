SELECT 
	CPF_CNPJ,
	Numero_do_Titulo,
	Serie_do_Titulo,
	Plano_do_Titulo,
	Id_Titulo,
	CONCAT('55', REPLACE(REPLACE(REPLACE(REPLACE(CELULAR, '(', ''), ')', ''), ' ', ''), '-', '')) AS CELULAR
FROM Tb_Boas_Vindas_Aniversario_Clientes_E_Titulos
WHERE CELULAR_VALIDO = 1