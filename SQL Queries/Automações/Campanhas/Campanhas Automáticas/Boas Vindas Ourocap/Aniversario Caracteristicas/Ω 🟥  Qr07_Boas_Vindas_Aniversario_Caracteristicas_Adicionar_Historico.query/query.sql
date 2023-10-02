SELECT 
	CPF_CNPJ,
	NUMERO_DO_TITULO,
	SERIE_DO_TITULO,
	PLANO_DO_TITULO,
	ID_TITULO,
  ID_CONTATO,
  ID_CLIENTE_PARCEIRO,
  DATA_INICIO_VIGENCIA,
  GETDATE() AS [Date]
FROM Tb_Boas_Vindas_Aniversario_Clientes_E_Titulos
WHERE
ISNULL(NAO_DESEJA_RECEBER_EMAIL, 0) = 0
AND EMAIL IS NOT NULL
AND EMAIL_VALIDO = 1