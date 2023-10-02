SELECT *
FROM TB_BOAS_VINDAS_POSTALCAP_COMOTC_NEOBPO
WHERE NAO_IMPORTUNE = 0
	AND NAO_DESEJA_RECEBER_TODOS_MEIOS = 0
	AND (
		NAO_DESEJA_RECEBER_EMAIL = 0
		OR NAO_DESEJA_RECEBER_SMS = 0
	)
	AND (
		EMAIL_VALIDO = 1
		OR CELULAR_VALIDO = 1
	) AND QUARENTENA = 0