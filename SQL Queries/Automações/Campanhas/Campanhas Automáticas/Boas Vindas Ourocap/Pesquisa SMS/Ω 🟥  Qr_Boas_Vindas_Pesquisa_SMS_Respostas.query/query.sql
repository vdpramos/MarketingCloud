SELECT DISTINCT
A.Mobile AS Celular,
A.MessageText AS Resposta,
A.CreateDateTime AS Data,
B.Id_Contato,
B.CPF_CNPJ,
B.Nome
FROM
_smsmessagetracking A
INNER JOIN Boas_Vindas_Pesquisa_SMS_Historico B ON A.Mobile = B.CELULAR
WHERE
CONVERT(VARCHAR, DATEADD(DD, 1, A.CreateDateTime), 101) = CONVERT(VARCHAR, GETDATE(), 101)
AND
A.Name = 'Boas_Vindas_Resposta'
AND
A.Inbound = 1