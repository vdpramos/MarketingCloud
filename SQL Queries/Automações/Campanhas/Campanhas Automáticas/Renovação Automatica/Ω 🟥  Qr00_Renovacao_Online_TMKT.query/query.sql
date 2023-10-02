SELECT
        CASE
          WHEN NULLIF(TEL_01, '') IS NULL THEN NULL
          WHEN LEN(Tel_01) > 9 OR ( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ) THEN NULL
          ELSE b.Ddd_01
        END AS DDD1,
        CASE
          WHEN NULLIF(TEL_01, '') IS NULL THEN NULL
          WHEN LEN(Tel_01) > 9 OR ( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ) THEN NULL
          ELSE Tel_01
        END AS TELEFONE1,
        CASE
          WHEN NULLIF(TEL_01, '') IS NULL THEN NULL
          WHEN LEN(Tel_01) > 9 OR ( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ) THEN NULL
          WHEN (len(B.TEL_01) = 9) THEN 'MÓVEL'
          ELSE 'FIXO'
        END AS TIPO1,
        CASE
          WHEN NULLIF(TEL_02, '') IS NULL THEN NULL
          WHEN LEN(Tel_02) > 9 OR ( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ) THEN NULL
          ELSE b.Ddd_02
        END AS DDD2,
        CASE
          WHEN NULLIF(TEL_02, '') IS NULL THEN NULL
          WHEN LEN(Tel_02) > 9 OR ( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ) THEN NULL
          ELSE Tel_02
        END AS TELEFONE2,
        CASE
          WHEN NULLIF(TEL_02, '') IS NULL THEN NULL
          WHEN LEN(Tel_02) > 9 OR ( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ) THEN NULL
          WHEN (len(B.TEL_02) = 9) THEN 'MÓVEL'
          ELSE 'FIXO'
        END AS TIPO2,
        CASE
          WHEN NULLIF(TEL_03, '') IS NULL THEN NULL
          WHEN LEN(Tel_03) > 9 OR ( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ) THEN NULL
          ELSE b.Ddd_03
        END AS DDD3,
        CASE
          WHEN NULLIF(TEL_03, '') IS NULL THEN NULL
          WHEN LEN(Tel_03) > 9 OR ( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ) THEN NULL
          ELSE Tel_03
        END AS TELEFONE3,
        CASE
          WHEN NULLIF(TEL_03, '') IS NULL THEN NULL
          WHEN LEN(Tel_03) > 9 OR ( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ) THEN NULL
          WHEN (len(B.TEL_03) = 9) THEN 'MÓVEL'
          ELSE 'FIXO'
        END AS TIPO3,
        CASE
          WHEN NULLIF(TEL_04, '') IS NULL THEN NULL
          WHEN LEN(Tel_04) > 9 OR ( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ) THEN NULL
          ELSE b.Ddd_04
        END AS DDD4,
        CASE
          WHEN NULLIF(TEL_04, '') IS NULL THEN NULL
          WHEN LEN(Tel_04) > 9 OR ( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ) THEN NULL
          ELSE Tel_04
        END AS TELEFONE4,
        CASE
          WHEN NULLIF(TEL_04, '') IS NULL THEN NULL
          WHEN LEN(Tel_04) > 9 OR ( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ) THEN NULL
          WHEN (len(B.TEL_04) = 9) THEN 'MÓVEL'
          ELSE 'FIXO'
        END AS TIPO4,
        CASE
          WHEN NULLIF(TEL_05, '') IS NULL THEN NULL
          WHEN LEN(Tel_05) > 9 OR ( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ) THEN NULL
          ELSE b.Ddd_05
        END AS DDD5,
        CASE
          WHEN NULLIF(TEL_05, '') IS NULL THEN NULL
          WHEN LEN(Tel_05) > 9 OR ( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ) THEN NULL
          ELSE Tel_05
        END AS TELEFONE5,
        CASE
          WHEN NULLIF(TEL_05, '') IS NULL THEN NULL
          WHEN LEN(Tel_05) > 9 OR ( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ) THEN NULL
          WHEN (len(B.TEL_05) = 9) THEN 'MÓVEL'
          ELSE 'FIXO'
        END AS TIPO5,        
        CONVERT(VARCHAR(10), a.Dt_Nascimento, 103) AS DATA_NASCIMENTO,
        B.Nome AS NOME_CLIENTE,
        B.CEP,
        a.UF_Residencial as UF,
        a.Tipo_Pessoa AS TIPO_DE_PESSOA,
        B.CPF as CPF_CNPJ,
        B.Sexo,
        B.Id_Campanha AS IDCAMPANHA,
        c.id AS IDCONTATOS,
        cp.id AS IDCP
FROM
    Renovacao_OTC291_Online_Filtrada_TMKT A
INNER JOIN Renovacao_Online_Filtrada_TMKT B ON A.CPF = B.CPF
INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = A.CPF
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE CP ON CP.HC_CPF_CNPJ__C = A.CPF  AND CP.HC_Chave_Parceiro__c = '52'
INNER JOIN CampaignMember_SALESFORCE CM ON CM.CONTACTID = C.ID AND CM.CampaignId = '7016g000000B5LZAA0'
WHERE 
 (LEN(NULLIF(Tel_01, '')) < 10 AND NOT( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_02, '')) < 10 AND NOT( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_03, '')) < 10 AND NOT( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_04, '')) < 10 AND NOT( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_05, '')) < 10 AND NOT( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ))
 AND C.ID IS NOT NULL AND CP.ID IS NOT NULL
  