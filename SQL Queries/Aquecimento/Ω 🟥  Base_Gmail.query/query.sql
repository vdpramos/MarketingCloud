
SELECT DISTINCT
Bf.CPF,
BF.NOME,
BF.EMAIL,
BF.EMAIL_VALIDO
FROM Base_Final BF
Where
Email like '%@gmail.com%'
OR
Email like '%@googlemail.com%'
