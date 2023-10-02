
	SELECT DISTINCT
		CPF,
		NOME,
		EMAIL,
		EMAIL_VALIDO
		
FROM Base_Internalizada BI 
	Where Email is not null and EMAIL_VALIDO  ='true'