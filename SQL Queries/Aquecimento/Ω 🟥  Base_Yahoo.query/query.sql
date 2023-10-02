
SELECT DISTINCT
Bf.CPF,
BF.NOME,
BF.EMAIL,
BF.EMAIL_VALIDO
FROM Base_Final BF
Where
Email like '%@yahoo.com%'
 or
Email like '%@aol.com%'
or
Email like '%@aim.com%'
or
Email like '%@ymail.com%'
or
Email like '%@verizon.net%'