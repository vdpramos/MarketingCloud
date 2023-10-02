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
        /* B.Tel_Principal AS PREFERENCIAL, */
        /* B.IDADE, */
        CONVERT(VARCHAR(10), a.Dt_Nascimento, 103) AS DATA_NASCIMENTO,
        B.Nome AS NOME_CLIENTE,
        B.CEP,
        a.UF_Residencial as UF,
        a.Tipo_Pessoa AS TIPO_DE_PESSOA,
        B.CPF as CPF_CNPJ,
        B.Sexo,
        A.Dia_Prov,
        /* B.Publico_Alvo AS CLASSIFICAÇAO, */
        /* B.Tipo_Campanha, */
        /* CONVERT(VARCHAR(10), B.Dt_Criacao_Mailing, 103) AS DATA_CRIAÇÃO, */
        /* CONVERT(VARCHAR(10), b.Dt_Inicio_Mailing, 103) AS DATA_UTILIZAÇÃO, */
        /* CONVERT(VARCHAR(10), B.Dt_Fim_Mailing, 103) AS DATA_TERMINO, */
        B.Id_Campanha AS IDCAMPANHA,
        a.Id_Contato AS IDCONTATOS,
        a.Id_Cliente_Parceiro AS IDCP
FROM
    Tb_Base_Prospect_OTC291_Online_Filtrada_NeoBpo_Pub1 A
INNER JOIN Tb_Base_Prospect_ComOTC_Online_Filtrada_NeoBpo_Pub1 B ON A.CPF = B.CPF

WHERE 
 (LEN(NULLIF(Tel_01, '')) < 10 AND NOT( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_02, '')) < 10 AND NOT( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_03, '')) < 10 AND NOT( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_04, '')) < 10 AND NOT( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_05, '')) < 10 AND NOT( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ))