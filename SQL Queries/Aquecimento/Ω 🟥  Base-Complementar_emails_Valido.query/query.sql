
	SELECT DISTINCT
	 CPF,
     NOME,
	 EMAIL,
	 EMAIL_VALIDO
	
	FROM Audiencia_Complementar
	WHERE
EMAIL is not null and EMAIL_VALIDO ='true'



