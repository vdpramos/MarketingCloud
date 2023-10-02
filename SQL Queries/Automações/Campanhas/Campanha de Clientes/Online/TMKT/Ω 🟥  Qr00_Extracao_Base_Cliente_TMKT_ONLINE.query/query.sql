SELECT
  /* telefone 1 */
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
    ELSE Tipo_Tel_01
  END AS TIPO1,
  /* telefone 2 */
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
    ELSE Tipo_Tel_02
  END AS TIPO2,
  /* telefone 3 */
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
    ELSE Tipo_Tel_03
  END AS TIPO3,
  /* telefone 4 */
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
    ELSE Tipo_Tel_04
  END AS TIPO4,
  /* telefone 5 */
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
    ELSE Tipo_Tel_05
  END AS TIPO5,
  B.Tel_Principal PREFERENCIAL,
  B.IDADE,
  CONVERT(VARCHAR(10), B.Dt_Nascimento, 103) AS DATA_NASCIMENTO,
  B.Nome AS NOME_CLIENTE,
  B.CEP,
  B.UF,
  B.Tipo_Pessoa TIPO_DE_PESSOA,
  B.CPF_CNPJ,
  B.Sexo,
  B.Publico_Alvo CLASSIFICAÇAO,
  B.Tipo_Campanha,
  CONVERT(VARCHAR(10), B.Dt_Criacao_Mailing, 103) AS DATA_CRIAÇÃO,
  CONVERT(VARCHAR(10), B.Dt_Inicio_Mailing, 103) AS DATA_UTILIZAÇÃO,
  CONVERT(VARCHAR(10), B.Dt_Fim_Mailing, 103) AS DATA_TERMINO,
  B.Id_Campanha IDCAMPANHA,
  B.Id_Contato IDCONTATOS,
  B.Id_Cliente_Parceiro AS IDCP
FROM
    Tb_Base_Cliente_OTC291_Filtrada_TMKT_ONLINE A
INNER JOIN Tb_Base_Cliente_Filtrada_TMKT_ONLINE B ON A.CPF = B.CPF_CNPJ