
SELECT DISTINCT
BF.CPF,
BF.NOME,
BF.EMAIL,
BF.EMAIL_VALIDO
FROM Base_Yahoo BF
LEFT JOIN Yahoo_DIV01_SUB01 D1S1 ON BF.CPF=D1S1.CPF
LEFT JOIN Yahoo_DIV01_SUB02 D1S2 ON BF.CPF=D1S2.CPF
LEFT JOIN Yahoo_DIV01_SUB03 D1S3 ON BF.CPF=D1S3.CPF
LEFT JOIN Yahoo_DIV01_SUB04 D1S4 ON BF.CPF=D1S4.CPF

LEFT JOIN Yahoo_DIV02_SUB01 D2S1 ON BF.CPF=D2S1.CPF
LEFT JOIN Yahoo_DIV02_SUB02 D2S2 ON BF.CPF=D2S2.CPF
LEFT JOIN Yahoo_DIV02_SUB03 D2S3 ON BF.CPF=D2S3.CPF
LEFT JOIN Yahoo_DIV02_SUB04 D2S4 ON BF.CPF=D2S4.CPF

LEFT JOIN Yahoo_DIV03_SUB01 D3S1 ON BF.CPF=D3S1.CPF
LEFT JOIN Yahoo_DIV03_SUB02 D3S2 ON BF.CPF=D3S2.CPF
LEFT JOIN Yahoo_DIV03_SUB03 D3S3 ON BF.CPF=D3S3.CPF
LEFT JOIN Yahoo_DIV03_SUB04 D3S4 ON BF.CPF=D3S4.CPF

Where
 D1S1.CPF IS NULL
AND D1S2.CPF IS NULL
AND D1S3.CPF IS NULL
AND D1S4.CPF IS NULL

AND D2S1.CPF IS NULL
AND D2S2.CPF IS NULL
AND D2S3.CPF IS NULL
AND D2S4.CPF IS NULL

AND D3S1.CPF IS NULL
AND D3S2.CPF IS NULL
AND D3S3.CPF IS NULL
AND D3S4.CPF IS NULL
