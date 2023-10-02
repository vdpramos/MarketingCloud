
SELECT DISTINCT
GmailD1S2.CPF,
GmailD1S2.NOME,
GmailD1S2.EMAIL,
GmailD1S2.EMAIL_VALIDO,
CASE

  WHEN CHARINDEX(' ', GmailD1S2.NOME) = 0 THEN GmailD1S2.NOME

  ELSE SUBSTRING( GmailD1S2.NOME , 1, CHARINDEX(' ', GmailD1S2.NOME) )

END AS PNOME
FROM Gmail_DIV01_SUB02 GmailD1S2
UNION
SELECT DISTINCT
MicrosodftD1S2.CPF,
MicrosodftD1S2.NOME,
MicrosodftD1S2.EMAIL,
MicrosodftD1S2.EMAIL_VALIDO,
CASE

  WHEN CHARINDEX(' ', MicrosodftD1S2.NOME) = 0 THEN MicrosodftD1S2.NOME

  ELSE SUBSTRING( MicrosodftD1S2.NOME , 1, CHARINDEX(' ', MicrosodftD1S2.NOME) )

END AS PNOME
FROM Microsoft_DIV01_SUB02 MicrosodftD1S2
UNION
SELECT DISTINCT
YahooD1S2.CPF,
YahooD1S2.NOME,
YahooD1S2.EMAIL,
YahooD1S2.EMAIL_VALIDO,
CASE

  WHEN CHARINDEX(' ', YahooD1S2.NOME) = 0 THEN YahooD1S2.NOME

  ELSE SUBSTRING( YahooD1S2.NOME , 1, CHARINDEX(' ', YahooD1S2.NOME) )

END AS PNOME
FROM Yahoo_DIV01_SUB02 YahooD1S2
UNION
SELECT DISTINCT
OutrosD1S2.CPF,
OutrosD1S2.NOME,
OutrosD1S2.EMAIL,
OutrosD1S2.EMAIL_VALIDO,
CASE

  WHEN CHARINDEX(' ', OutrosD1S2.NOME) = 0 THEN OutrosD1S2.NOME

  ELSE SUBSTRING( OutrosD1S2.NOME , 1, CHARINDEX(' ', OutrosD1S2.NOME) )

END AS PNOME
FROM Outros_DIV01_SUB02 OutrosD1S2
