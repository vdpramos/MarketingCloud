SELECT 
	CPF_CNPJ,
	Numero_do_Titulo,
	Serie_do_Titulo,
	Plano_do_Titulo,
	Id_Titulo,
	CONCAT('55', REPLACE(REPLACE(REPLACE(REPLACE(CELULAR, '(', ''), ')', ''), ' ', ''), '-', '')) AS CELULAR
FROM TB_BOAS_VINDAS_OUROCAP_CLIENTES_E_TITULOS
WHERE CELULAR_VALIDO = 1