SELECT 
	ID,
	'55' + REPLACE(REPLACE(REPLACE(REPLACE(CELULAR, '(', ''), ')', ''), ' ', ''), '-', '') AS CELULAR
FROM TB_BOAS_VINDAS_POSTALCAP_COMOTC_NEOBPO
WHERE CELULAR_VALIDO = 1