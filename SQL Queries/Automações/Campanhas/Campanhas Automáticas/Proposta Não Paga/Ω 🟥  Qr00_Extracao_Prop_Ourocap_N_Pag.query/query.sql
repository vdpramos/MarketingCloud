SELECT
        CASE
          WHEN NULLIF(TEL_01, '') IS NULL THEN NULL
          WHEN LEN(Tel_01) > 9 OR ( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ) THEN NULL
          ELSE Ddd_Tel_01
        END AS DDD1,
        CASE
          WHEN NULLIF(TEL_01, '') IS NULL THEN NULL
          WHEN LEN(Tel_01) > 9 OR ( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ) THEN NULL
          ELSE Tel_01
        END AS TELEFONE1,
        CASE
          WHEN NULLIF(TEL_01, '') IS NULL THEN NULL
          WHEN LEN(Tel_01) > 9 OR ( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ) THEN NULL
          ELSE B.Tipo_Tel_01
        END AS TIPO1,
        CASE
          WHEN NULLIF(TEL_02, '') IS NULL THEN NULL
          WHEN LEN(Tel_02) > 9 OR ( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ) THEN NULL
          ELSE Ddd_Tel_02
        END AS DDD2,
        CASE
          WHEN NULLIF(TEL_02, '') IS NULL THEN NULL
          WHEN LEN(Tel_02) > 9 OR ( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ) THEN NULL
          ELSE Tel_02
        END AS TELEFONE2,
        CASE
          WHEN NULLIF(TEL_02, '') IS NULL THEN NULL
          WHEN LEN(Tel_02) > 9 OR ( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ) THEN NULL
          ELSE B.Tipo_Tel_02
        END AS TIPO2,
        CASE
          WHEN NULLIF(TEL_03, '') IS NULL THEN NULL
          WHEN LEN(Tel_03) > 9 OR ( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ) THEN NULL
          ELSE Ddd_Tel_03
        END AS DDD3,
        CASE
          WHEN NULLIF(TEL_03, '') IS NULL THEN NULL
          WHEN LEN(Tel_03) > 9 OR ( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ) THEN NULL
          ELSE Tel_03
        END AS TELEFONE3,
        CASE
          WHEN NULLIF(TEL_03, '') IS NULL THEN NULL
          WHEN LEN(Tel_03) > 9 OR ( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ) THEN NULL
          ELSE B.Tipo_Tel_03
        END AS TIPO3,
        CASE
          WHEN NULLIF(TEL_04, '') IS NULL THEN NULL
          WHEN LEN(Tel_04) > 9 OR ( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ) THEN NULL
          ELSE Ddd_Tel_04
        END AS DDD4,
        CASE
          WHEN NULLIF(TEL_04, '') IS NULL THEN NULL
          WHEN LEN(Tel_04) > 9 OR ( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ) THEN NULL
          ELSE Tel_04
        END AS TELEFONE4,
        CASE
          WHEN NULLIF(TEL_04, '') IS NULL THEN NULL
          WHEN LEN(Tel_04) > 9 OR ( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ) THEN NULL
          ELSE B.Tipo_Tel_04
        END AS TIPO4,
        CASE
          WHEN NULLIF(TEL_05, '') IS NULL THEN NULL
          WHEN LEN(Tel_05) > 9 OR ( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ) THEN NULL
          ELSE Ddd_Tel_05
        END AS DDD5,
        CASE
          WHEN NULLIF(TEL_05, '') IS NULL THEN NULL
          WHEN LEN(Tel_05) > 9 OR ( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ) THEN NULL
          ELSE Tel_05
        END AS TELEFONE5,
        CASE
          WHEN NULLIF(TEL_05, '') IS NULL THEN NULL
          WHEN LEN(Tel_05) > 9 OR ( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ) THEN NULL
          ELSE B.Tipo_Tel_05
        END AS TIPO5,        
        B.Tel_Principal AS PREFERENCIAL,
        B.IDADE,
        CONVERT(VARCHAR(10), B.Dt_Nascimento, 103) AS DATA_NASCIMENTO,
        B.Nome AS NOME_CLIENTE,
        B.CEP,
        B.UF,
        B.Tipo_Pessoa AS TIPO_DE_PESSOA,
        B.CPF_CNPJ,
        B.Sexo,
        B.Publico_Alvo AS CLASSIFICAÇAO,
        B.Tipo_Campanha,
        CONVERT(VARCHAR(10), B.Dt_Criacao_Mailing, 103) AS DATA_CRIAÇÃO,
        CONVERT(VARCHAR(10), B.Dt_Inicio_Mailing, 103) AS DATA_UTILIZAÇÃO,
        CONVERT(VARCHAR(10), B.Dt_Fim_Mailing, 103) AS DATA_TERMINO,
        B.Id_Campanha AS IDCAMPANHA,
        B.Id_Contato AS IDCONTATOS,
        B.Id_Cliente_Parceiro AS IDCP
FROM
    Prop_Ourocap_N_Pag_OTC291_Filtrada A
INNER JOIN Tb_Base_Prop_Ourocap_N_Pag B ON A.CPF = B.CPF_CNPJ

WHERE 
 ( (LEN(NULLIF(Tel_01, '')) < 10 AND NOT( LEN(Tel_01) = 8 AND Tel_01 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_02, '')) < 10 AND NOT( LEN(Tel_02) = 8 AND Tel_02 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_03, '')) < 10 AND NOT( LEN(Tel_03) = 8 AND Tel_03 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_04, '')) < 10 AND NOT( LEN(Tel_04) = 8 AND Tel_04 LIKE '9%' ))
 OR (LEN(NULLIF(Tel_05, '')) < 10 AND NOT( LEN(Tel_05) = 8 AND Tel_05 LIKE '9%' ))
 )/*
 AND B.HC_Origem_da_Venda__c IN (
  'TIVIT - Vendas Diretas',
  'TIVIT - Venda Nova',
  'TIVIT - Revenda',
  'BRASILCAP - VENDAS DIRETAS',
  'Brasilcap - Tivit Variável',
  'Brasilcap - TMKT'
)*/