SELECT 
   BASE.*
FROM (
  SELECT
    B.HC_CPF_CNPJ__C AS CPF_CNPJ,
    replace( replace( replace( replace( replace( replace( replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (C.NAME, 'á', 'a'),'é', 'e'),'í', 'i'),'ó', 'o'),'ú', 'u'),'Á', 'A'),'É', 'E'),'Í', 'I'),'Ó', 'O'),'Ú', 'U'),'à', 'a'),'À', 'A'),'ã', 'a'),'õ', 'o'),'Ã', 'A'),  'Õ', 'O'),'â', 'a'),'ê', 'e'),'ô', 'o'),'Â', 'A'),'Ê', 'E'),'Ô', 'O'),'ç', 'c'),'Ç', 'c') , '-', '') , '+', '') , '|', '') , '$', '') , '%', '') , '&', '') as NOME,
    HC_IDADE__C AS IDADE,
    HC_DATA_DE_NASCIMENTO__C AS DT_NASCIMENTO,
    HC_GENERO_DO_CLIENTE__C AS SEXO,
    B.HC_PARCEIRO__C AS PARCEIRO,
    CASE 
      WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'RESIDENCIAL' THEN HC_CEP_RES__C
      WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'COMERCIAL' THEN HC_CEP_COM__C
      WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'CORRESPONDÊNCIA' THEN HC_CEP_COR__C
    END AS CEP,
    CASE 
      WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'RESIDENCIAL' THEN HC_UF_RES__C
      WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'COMERCIAL' THEN HC_UF_COM__C
      WHEN UPPER(B.HC_ENDERECO_PRINCIPAL__C) = 'CORRESPONDÊNCIA' THEN HC_UF_COR__C
    END AS UF,
    HC_TIPO_DE_PESSOA__C AS TIPO_PESSOA,
    LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_RESIDENCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_01,
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_RESIDENCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_01,
    'FIXO' AS TIPO_TEL_01,
    LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_COMERCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_02,
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_COMERCIAL__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_02,
    'FIXO' AS TIPO_TEL_02,
    LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_OUTRO__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_03,
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_TELEFONE_OUTRO__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_03,
    'FIXO' AS TIPO_TEL_03,
    LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_1__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_04,
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_1__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_04,
    'MÓVEL' AS TIPO_TEL_04,
    LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_2__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_05,
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_2__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_05,
    'MÓVEL' AS TIPO_TEL_05,
    LEFT(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_3__C, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_06,
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(HC_CELULAR_3__C, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_06,
    'MÓVEL' AS TIPO_TEL_06,
    HC_TELEFONE_PRINCIPAL__C AS TEL_PRINCIPAL,
    B.HC_CLASSIFICACAO__C AS PUBLICO_ALVO,
    A.[TYPE] AS TIPO_CAMPANHA,
    A.STARTDATE AS DT_INICIO_MAILING,
    A.ENDDATE AS DT_FIM_MAILING,
    A.HC_VALIDA_ALTA_RENDA__C AS CAMPANHA_VALIDA_ENCARTEIRAMENTO,
    A.HC_VALIDA_NAO_IMPORTUNE__C AS CAMPANHA_NAO_IMPORTUNE,
    A.HC_VALIDA_RNA__C AS CAMPANHA_VALIDA_RNA,
    A.HC_PRODUTO__C AS ID_PRODUTO,
    A.HC_PRECO_DO_PRODUTO__C AS ID_PRODUTO_VALOR,
    B.HC_CPF_CNPJ__C AS ID,
    A.ID AS ID_CAMPANHA, 
    B.ID AS ID_CLIENTE_PARCEIRO,
    C.ID AS ID_CONTATO,
    B.HC_Cliente__c AS ID_CLIENTE,
    B.HC_CPF_CNPJ_CODIGO_DO_PARCEIRO__C AS CPF_CNPJ_CODIGO_DO_PARCEIRO,
    Convert (Char(10),TI1.HC_Data_do_ultimo_resgate__c,120)  AS Data_Ultimo_Resgate,
    ROW_NUMBER() OVER(ORDER BY B.ID ASC) AS ROWNO
  FROM (
    SELECT
      A.ID AS CAMPAIGN_ID,
      B.ID AS RELACAO_CLIENTE_PARCEIRO_ID,
      C.ID AS CONTACT_ID,
      TI.ID AS ID_TITULO,
      ROW_NUMBER() OVER(PARTITION BY B.ID ORDER BY B.ID ASC) AS NUMBER_OF_CPF_REPETITION
    FROM CAMPAIGN_SALESFORCE A
    INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B 
        ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C
        AND A.[TYPE] = B.HC_CLASSIFICACAO__C
    INNER JOIN Contact_Salesforce C 
        ON C.HC_CPF_CNPJ__c = B.HC_CPF_CNPJ__c
    LEFT JOIN HC_PROPOSTA__C_SALESFORCE P 
        ON P.HC_CPF_CNPJ_TITULAR__C = B.HC_CPF_CNPJ__C 
        AND DATEDIFF(DAY, CONVERT(CHAR(10), P.CREATEDDATE, 112), CONVERT(CHAR(10), GETDATE(), 112)) <= A.HC_COMPRA_RECENTE__C
    LEFT JOIN TB_BASE_QUARENTENA Q ON Q.CPF_CNPJ = B.HC_CPF_CNPJ__C 
        AND Q.DATA_PARTICIPACAO_CAMPANHA > DATEADD(DD, -90, GETDATE())
    /* Remove ja adicionados */
    /*LEFT JOIN Publico_Apto_Ex_Clientes_TMKT aptos 
        ON aptos.CPF_CNPJ = B.HC_CPF_CNPJ__C
    LEFT JOIN Publico_Inapto_Ex_Clientes_TMKT inaptos 
        ON inaptos.CPF_CNPJ = B.HC_CPF_CNPJ__C*/
    INNER JOIN HC_TITULO__C_SALESFORCE TI
        ON TI.HC_CLIENTE_X_PARCEIRO__C = B.ID
    WHERE
      /*  aptos.CPF_CNPJ IS NULL 
      AND inaptos.CPF_CNPJ IS NULL*/
      Convert (Char(10),TI.HC_Data_do_ultimo_resgate__c,120) > Convert (Char(10), GetDate()-90, 120)
      AND TI.HC_Data_do_ultimo_resgate__c IS NOT NULL
      AND TI.HC_Situacao__c IN ('Baixado Resgate Pago', 'Finalizado - Resgate Pago', 'Finalizado - Antecipado Total')
      AND Q.CPF_CNPJ IS NULL
      AND A.HC_FORMATO__C = 'Offline'
      AND (A.HC_TIPO_DE_CLIENTE__C = b.HC_TIPO_DE_PESSOA__C OR A.HC_TIPO_DE_CLIENTE__C = 'PF E PJ')
      AND B.ENCARTEIRAMENTO__C NOT IN ('ESTILO','PRIVATE','RURAL ESTILO','PRIVATE MISTA','PRIVATE MISTA 3','PRIVATE AFLUENTE',
                                         'PRIVATE JUNIOR','PRIVATE FAMILY OFFIC','SPECIAL','PRIVATE SOFISTICADO','DESC_ENCARTEIRAMENTO',
                                         'PRIVATE ULTRA-HIGH','ESTILO REMOTO','PRIVATE MISTA 2','PRIVATE PRODUTOR RUR','GRUPO NEG PRIVATE',
                                         'PREMIUM','PRIVATE SUPERIOR','PRIVATE PLENO','PRIVATE SENIOR')
      AND A.IsActive = 1
      AND ISNULL(B.HC_CONSELHEIRO__C, 0) = 0
      AND ISNULL(B.HC_PEP__C, 0) = 0
      AND ISNULL(B.HC_NAO_DESEJA_RECEBER_LIGACOES__C, 0) = 0
      AND ISNULL(B.HC_NAO_DESEJA_RECEBER_TODOS_MEIOS__C, 0) = 0
      AND B.HC_IDADE__C BETWEEN 18 AND 70
      AND B.HC_Endereco_Principal__c IS NOT NULL
      AND ((B.HC_Conta_Principal__c = 'Conta 1' AND hc_TIPO_DA_CONTA_1__C = 'CONTA CORRENTE')
        OR (B.HC_Conta_Principal__c = 'Conta 2' AND hc_TIPO_DA_CONTA_2__C = 'CONTA CORRENTE')
      )
      AND (
        (HC_Status_Tel_Comercial__c = 'VÁLIDO' AND HC_TELEFONE_COMERCIAL__C IS NOT NULL)
        OR (HC_Status_Tel_Outro__c = 'VÁLIDO' AND HC_TELEFONE_OUTRO__C IS NOT NULL)
        OR (HC_Status_Tel_Residencial__c = 'VÁLIDO' AND HC_TELEFONE_RESIDENCIAL__C IS NOT NULL)
        OR (HC_Status_Celular_1__c = 'VÁLIDO' AND HC_CELULAR_1__C IS NOT NULL)
        OR (HC_Status_Celular_2__c = 'VÁLIDO' AND HC_CELULAR_2__C IS NOT NULL)
        OR (HC_Status_Celular_3__c = 'VÁLIDO' AND HC_CELULAR_3__C IS NOT NULL)
      ) 
        ) FILTERED
  INNER JOIN CAMPAIGN_SALESFORCE A 
        ON A.ID = FILTERED.CAMPAIGN_ID
  INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B 
        ON B.ID = FILTERED.RELACAO_CLIENTE_PARCEIRO_ID
  INNER JOIN Contact_Salesforce C 
        ON C.ID = FILTERED.CONTACT_ID
  INNER JOIN HC_TITULO__C_SALESFORCE TI1
        ON TI1.ID = FILTERED.ID_TITULO
  WHERE FILTERED.NUMBER_OF_CPF_REPETITION = 1
) BASE
INNER JOIN CAMPAIGN_SALESFORCE CAMP
  ON BASE.ID_CAMPANHA = CAMP.ID