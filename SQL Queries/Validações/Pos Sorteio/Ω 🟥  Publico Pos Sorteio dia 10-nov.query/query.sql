SELECT
  BASE.*
FROM (
  SELECT
    B.HC_CPF_CNPJ__C AS CPF,
    C.NAME AS NOME,
    B.HC_NAO_DESEJA_RECEBER_EMAIL__C as NAO_DESEJA_RECEBER_EMAIL,
    B.HC_NAO_DESEJA_RECEBER_SMS__C as NAO_DESEJA_RECEBER_SMS,
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
      WHEN B.HC_EMAIL_PRINCIPAL__C IN ('Brasilcap', 'Comercial', 'Pessoal') THEN 1
      WHEN B.HC_EMAIL_BRASILCAP__C IS NOT NULL THEN 1
      WHEN B.HC_EMAIL_COMERCIAL__C IS NOT NULL THEN 1
      WHEN B.HC_EMAIL_PESSOAL__C IS NOT NULL THEN 1
      ELSE 0
    END AS EMAIL_VALIDO,
    CASE
      WHEN B.HC_TELEFONE_PRINCIPAL__C = 'Celular 1' THEN B.HC_CELULAR_1__C
      WHEN B.HC_TELEFONE_PRINCIPAL__C = 'Celular 2' THEN B.HC_CELULAR_2__C
      WHEN B.HC_TELEFONE_PRINCIPAL__C = 'Celular 3' THEN B.HC_CELULAR_3__C
      WHEN B.HC_TELEFONE_PRINCIPAL__C = 'Celular 3_3' THEN B.HC_CELULAR_3_3__C
      WHEN B.HC_TELEFONE_PRINCIPAL__C = 'Celular 4' THEN B.HC_CELULAR_4__C
      WHEN B.HC_STATUS_CELULAR_1__C IS NOT NULL THEN B.HC_CELULAR_1__C
      WHEN B.HC_STATUS_CELULAR_2__C IS NOT NULL THEN B.HC_CELULAR_2__C
      WHEN B.HC_STATUS_CELULAR_3__C IS NOT NULL THEN B.HC_CELULAR_3__C
      WHEN B.HC_STATUS_CELULAR_3_3__C IS NOT NULL THEN B.HC_CELULAR_3_3__C
      WHEN B.HC_STATUS_CELULAR_4__C IS NOT NULL THEN B.HC_CELULAR_4__C
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
    A.ID AS ID_CAMPANHA, 
    B.ID AS ID_CLIENTE_PARCEIRO,
    C.ID AS ID_CONTATO,
    D.ID AS ID_TITULO,
    'BR' as Locale,
    A.HC_Mes_Inicio__c,
    A.HC_Mes_Fim__c,
    A.HC_Quantidade_de_clientes_sorteados__c,
    A.HC_Valor_do_premio__c,
    Sorteio,
    Premio_Email,
    Descricao,
    format(convert(datetime, '2022-11-10'), 'dd/MM/yyyy', 'pt-br') as Data_Envio,
    format(dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10')), 'dd/MM/yyyy', 'pt-br') as Data_Sorteio,
    ROW_NUMBER() OVER(ORDER BY B.HC_CPF_CNPJ__C ASC) AS ROWNO
  FROM (
    SELECT
      A.ID as CAMPAIGNID,
      B.ID AS CLIENTEPARCEIROID,
      C.ID AS CONTACTID,
      D.ID AS TITULOID,
      [Dispara dias antes],
      Sorteio,
      Premio_Email,
      Descricao,
      row_number() over (PARTITION BY B.HC_CPF_CNPJ__C, D.ID ORDER BY B.ID) AS ROW
    FROM CAMPAIGN_SALESFORCE A
    INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON 1 = 1
    INNER JOIN CONTACT_SALESFORCE C ON C.HC_CPF_CNPJ__C = B.HC_CPF_CNPJ__C
    INNER JOIN HC_TITULO__C_SALESFORCE D ON D.HC_CLIENTE_X_PARCEIRO__C = B.ID
    INNER JOIN POS_SORTEIO_RELACAO_PLANOS PLANOS ON PLANOS.PLANO = D.HC_PLANO__C
    where 
      /* ------- CONFIG DA CAMPANHA ------- */
      A.ID = '7016g000000TdvVAAS'
          /* Data de Execução */
      /* AND CONVERT(VARCHAR(10), A.HC_DATA_DE_EXECUCAO__C, 101) = CONVERT(VARCHAR(10), convert(datetime, '2022-11-10'), 101) */
      /* AND DATEPART(HH, A.HC_DATA_DE_EXECUCAO__C) = DATEPART(HH, convert(datetime, '2022-11-10')) */
        /* Tipo de cliente controlado pela campanha */
      AND (B.HC_TIPO_DE_PESSOA__C = A.HC_TIPO_DE_CLIENTE__C OR (A.HC_TIPO_DE_CLIENTE__C = 'PF E PJ' ))
      /* ------- CONFIG DE TITULO ------- */
      AND D.HC_SITUACAO__C = 'ATIVO'
      /*  and data_sorteio (paramatrizar na campanha) <= d.HC_Fim_previsto__c */
      /* ------- CONFIG DE CLIENTE PARCEIRO ------- */
      AND B.HC_NAO_DESEJA_RECEBER_TODOS_MEIOS__C = 0
      AND (ISNULL(B.HC_NAO_IMPORTUNE__C, 0) = 0 OR A.HC_VALIDA_NAO_IMPORTUNE__C = 0)
        /* Pode receber comunicação por algum canal (E-mail ou SMS) */
      AND (
        /* Pode receber e-mail */
        ( ISNULL(B.HC_NAO_DESEJA_RECEBER_EMAIL__C, 0) = 0 AND ( B.HC_EMAIL_BRASILCAP__C IS NOT NULL OR B.HC_EMAIL_COMERCIAL__C IS NOT NULL OR B.HC_EMAIL_PESSOAL__C IS NOT NULL ) )
        /* ou pode receber sms */
        OR ( ISNULL(B.HC_NAO_DESEJA_RECEBER_SMS__C, 0) = 0 AND (B.HC_STATUS_CELULAR_1__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_2__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_3__C = 'VÁLIDO' 
          OR B.HC_STATUS_CELULAR_3_3__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_4__C = 'VÁLIDO') )
      )
      AND B.HC_CLASSIFICACAO__C = 'Cliente'
      AND B.HC_PARCEIRO__C = A.HC_PARCEIRO__C
      /* LOGICA DE DISPARO */
        /* dia da semana do dia de disparo (hoje + dias de disparo anterior informado na base) = dia da semana desejaado para disparo  */
      AND format(dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10')), 'dddd') = [Dia da semana]
        /* mes da execucao */
      AND (
        (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 1 AND JANEIRO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 2 AND FEVEREIRO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 3 AND MARCO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 4 AND ABRIL = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 5 AND MAIO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 6 AND JUNHO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 7 AND JULHO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 8 AND AGOSTO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 9 AND SETEMBRO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 10 AND OUTUBRO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 11 AND NOVEMBRO = 1)
        OR (DATEPART(month, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) = 12 AND DEZEMBRO = 1)
      )
      AND (
        /* ou NÃO ocorre apenas na primeira semana */
        (
          Ocorre_Apenas_Na_Primeira_Semana = 0
        )
        /* Ou a data é na primeira semana */
        OR (
          Ocorre_Apenas_Na_Primeira_Semana = 1
          AND DATEPART(dd, dateadd(dd, [Dispara dias antes], convert(datetime, '2022-11-10'))) <= 7
        )
      )
    ) SELECTED
    INNER JOIN CAMPAIGN_SALESFORCE A ON SELECTED.CAMPAIGNID = A.ID
    INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON SELECTED.CLIENTEPARCEIROID = B.ID
    INNER JOIN CONTACT_SALESFORCE C ON SELECTED.CONTACTID = C.ID
    INNER JOIN HC_TITULO__C_SALESFORCE D ON SELECTED.TITULOID = D.ID
  WHERE SELECTED.ROW = 1
) BASE
INNER JOIN
  CAMPAIGN_SALESFORCE CAMP
  ON BASE.ID_CAMPANHA = CAMP.ID
WHERE
	CAMP.HC_QUANTIDADE_DE_CONTATOS_NO_MAILING__C IS NULL
	OR BASE.ROWNO <= (CAMP.HC_QUANTIDADE_DE_CONTATOS_NO_MAILING__C)