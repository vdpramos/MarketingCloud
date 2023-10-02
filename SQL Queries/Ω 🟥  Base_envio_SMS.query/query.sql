SELECT
NOME,
CONCAT('55',A.TELEFONE) AS TELEFONE,
'pt-br' as locale,
CASE WHEN B.SUBSCRIBERKEY IS NOT NULL THEN B.SUBSCRIBERKEY
    ELSE CONCAT('55',A.TELEFONE)
    END AS ID
FROM    BASE_ENVIO_SMS A
LEFT JOIN _SMSSubscriptionLog B ON MobileNumber = CONCAT('55',A.TELEFONE)