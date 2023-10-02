SELECT DISTINCT
Id_Contato, 
CPF_CNPJ, 
Celular, 
Nome, 
Resposta, 
Data
FROM
Boas_Vindas_Respostas_SMS
WHERE
MONTH(Data) = MONTH(GETDATE())
AND 
DATEPART(YYYY, Data) = DATEPART(YYYY, GETDATE())