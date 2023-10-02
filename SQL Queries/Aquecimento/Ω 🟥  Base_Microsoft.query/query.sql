
SELECT DISTINCT
Bf.CPF,
BF.NOME,
BF.EMAIL,
BF.EMAIL_VALIDO
FROM Base_Final BF
Where
  Email like '%@hotmail.com%'
 or
 Email like '%@outlook.com%'
 or
 Email like '%@live.com%'
 or
 Email like '%@msn.com%'