SELECT
  B.HC_CPF_CNPJ__C AS CPF_CNPJ,
  C.NAME AS NOME,
  CASE
    WHEN B.HC_EMAIL_PRINCIPAL__C = 'Brasilcap' THEN HC_EMAIL_BRASILCAP__C
    WHEN B.HC_EMAIL_PRINCIPAL__C = 'Comercial' THEN HC_EMAIL_COMERCIAL__C
    WHEN B.HC_EMAIL_PRINCIPAL__C = 'Pessoal' THEN HC_EMAIL_PESSOAL__C
    WHEN B.HC_EMAIL_BRASILCAP__C IS NOT NULL THEN HC_EMAIL_BRASILCAP__C
    WHEN B.HC_EMAIL_COMERCIAL__C IS NOT NULL THEN HC_EMAIL_COMERCIAL__C
    WHEN B.HC_EMAIL_PESSOAL__C IS NOT NULL THEN HC_EMAIL_PESSOAL__C
    ELSE NULL
  END AS EMAIL,
  CASE
    WHEN B.HC_EMAIL_BRASILCAP__C IS NOT NULL THEN 1
    WHEN B.HC_EMAIL_COMERCIAL__C IS NOT NULL THEN 1
    WHEN B.HC_EMAIL_PESSOAL__C IS NOT NULL THEN 1
    ELSE 0
  END AS EMAIL_VALIDO,
  CASE
    WHEN B.HC_TELEFONE_PRINCIPAL__C = 'CELULAR 1' THEN HC_CELULAR_1__C
    WHEN B.HC_TELEFONE_PRINCIPAL__C = 'CELULAR 2' THEN HC_CELULAR_2__C
    WHEN B.HC_TELEFONE_PRINCIPAL__C = 'CELULAR 3' THEN HC_CELULAR_3__C
    WHEN B.HC_TELEFONE_PRINCIPAL__C = 'CELULAR 3_3' THEN HC_CELULAR_3_3__C
    WHEN B.HC_TELEFONE_PRINCIPAL__C = 'CELULAR 4' THEN HC_CELULAR_4__C
    WHEN B.HC_STATUS_CELULAR_1__C = 'VÁLIDO' THEN HC_CELULAR_1__C
    WHEN B.HC_STATUS_CELULAR_2__C = 'VÁLIDO' THEN HC_CELULAR_2__C
    WHEN B.HC_STATUS_CELULAR_3__C = 'VÁLIDO' THEN HC_CELULAR_3__C
    WHEN B.HC_STATUS_CELULAR_3_3__C = 'VÁLIDO' THEN HC_CELULAR_3_3__C
    WHEN B.HC_STATUS_CELULAR_4__C = 'VÁLIDO' THEN HC_CELULAR_4__C
    ELSE NULL
  END AS CELULAR,
  CASE
    WHEN B.HC_STATUS_CELULAR_1__C = 'VÁLIDO' THEN 1
    WHEN B.HC_STATUS_CELULAR_2__C = 'VÁLIDO' THEN 1
    WHEN B.HC_STATUS_CELULAR_3__C = 'VÁLIDO' THEN 1
    WHEN B.HC_STATUS_CELULAR_3_3__C = 'VÁLIDO' THEN 1
    WHEN B.HC_STATUS_CELULAR_4__C = 'VÁLIDO' THEN 1
    ELSE 0
  END AS CELULAR_VALIDO,
  B.HC_NAO_DESEJA_RECEBER_SMS__C AS NAO_DESEJA_RECEBER_SMS,
  B.HC_NAO_DESEJA_RECEBER_EMAIL__C AS NAO_DESEJA_RECEBER_EMAIL,
  A.ID AS ID_CAMPANHA, 
  B.ID AS ID_CLIENTE_PARCEIRO,
  C.ID AS ID_CONTATO,
  PROP.ID AS ID_PROPOSTA,
  PROP.CREATEDDATE
FROM CAMPAIGN_SALESFORCE A
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON A.HC_PARCEIRO__C = B.HC_PARCEIRO__C
INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C
INNER JOIN HC_PROPOSTA__C_SALESFORCE PROP ON B.ID = PROP.HC_TITULAR__C
LEFT JOIN BOAS_VINDAS_HISTORICO_PROPOSTAS HIST ON HIST.ID_PROPOSTA = PROP.ID
WHERE
  (B.HC_TIPO_DE_PESSOA__C = A.HC_TIPO_DE_CLIENTE__C OR A.HC_TIPO_DE_CLIENTE__C = 'PF E PJ')
  /* MOMENTO DE EXECUÇÃO DA CAMPANHA */
  AND CONVERT(VARCHAR(10), A.HC_DATA_DE_EXECUCAO__C, 101) = CONVERT(VARCHAR(10), GETDATE(), 101)
    AND DATEPART(HH, A.HC_DATA_DE_EXECUCAO__C) = DATEPART(HH, GETDATE())
  AND A.ISACTIVE = 1
  AND A.ID = '7016g000000NVrcAAG'
  /* NAO EXECUTAR PARA A MESMA PROPOSTA DUAS VEZES */
  AND HIST.ID_PROPOSTA IS NULL
  /* AND PROP.HC_SITUACAO__C NOT IN ('Cancelada pelo OTC', 'Cancelada') */
  /* PARCEIRO TCBB PARA OUROCAP */
  AND A.HC_PARCEIRO__C = B.HC_PARCEIRO__C
  AND ISNULL(B.HC_NAO_DESEJA_RECEBER_TODOS_MEIOS__C, 0) = 0
  AND PROP.CREATEDDATE BETWEEN A.HC_DATA_INICIAL_DE_COMPRA__C AND A.HC_DATA_FINAL_DE_COMPRA__C
  AND (
    /* CUSTOM BETWEEN */
    (A.HC_VALOR_MINIMO_DE_PARCELA__C IS NULL OR PROP.HC_VALOR__C > A.HC_VALOR_MINIMO_DE_PARCELA__C)
    AND (A.HC_VALOR_MAXIMO_DA_PARCELA__C IS NULL OR PROP.HC_VALOR__C < A.HC_VALOR_MAXIMO_DA_PARCELA__C)
  )
  /* PRECISA TER UM CANAL VALIDO PARA RECEBER A COMUNICAÇÃO */
  AND (
    /* Ter e-mail valido e deseja receber e-mail*/
    (( B.HC_EMAIL_BRASILCAP__C IS NOT NULL OR B.HC_EMAIL_COMERCIAL__C IS NOT NULL OR B.HC_EMAIL_PESSOAL__C IS NOT NULL ) AND ISNULL(B.HC_NAO_DESEJA_RECEBER_EMAIL__C, 0) = 0 )
    /* ou celular valido e deseja receber sms */
    OR (
        ( B.HC_STATUS_CELULAR_1__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_2__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_3__C = 'VÁLIDO' 
        OR B.HC_STATUS_CELULAR_3_3__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_4__C = 'VÁLIDO' ) 
      AND ISNULL(B.HC_NAO_DESEJA_RECEBER_SMS__C, 0) = 0 )
  )