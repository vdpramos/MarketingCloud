SELECT CPF_CNPJ,
NOME,
Id_Campanha, 
Id_Cliente_Parceiro, 
Id_Contato, 
Id_Cliente,
Nao_Deseja_Receber_Email,
Nao_Deseja_Receber_SMS,
HC_Data_Nascimento__c,
Email_Valido,
Celular_Valido,
EMAIL AS EMAILADDRESS,
CELULAR AS MOBILEPHONE,
'BR' AS LOCALE
FROM Tb_Campanha_FimdeAno2021_Base
WHERE Email_Valido = '1' OR Celular_Valido = '1'