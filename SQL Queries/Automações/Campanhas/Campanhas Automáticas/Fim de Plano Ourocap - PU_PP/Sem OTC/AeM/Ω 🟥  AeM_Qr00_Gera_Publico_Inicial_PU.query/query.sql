SELECT
	base.*
FROM (
	SELECT DISTINCT
		B.HC_CPF_CNPJ__C AS CPF_CNPJ,
		REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(C.NAME,'á','A'),'à','A'),'â','A'),'ã','A'),'ä','A'),'é','E'),'è','E'),'ê','E'),'ë','E'),'í','I'),'ì','I'),'î','I'),'ï','I'),'ó','O'),'ò','O'),'ô','O'),'õ','O'),'ö','O'),'ú','U'),'ù','U'),'û','U'),'ü','U') AS NOME,
		B.HC_IDADE__C AS IDADE,
		B.HC_DATA_DE_NASCIMENTO__C AS DT_NASCIMENTO,
		B.HC_GENERO_DO_CLIENTE__C AS SEXO,
		B.HC_PARCEIRO__C AS PARCEIRO,
		B.HC_TIPO_DE_PESSOA__C AS TIPO_PESSOA,
		B.HC_NAO_DESEJA_RECEBER_SMS__C AS NAO_DESEJA_RECEBER_SMS,
		B.HC_NAO_DESEJA_RECEBER_EMAIL__C AS NAO_DESEJA_RECEBER_EMAIL,
		d.HC_renovacao_automatica__c,
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
		A.STARTDATE AS DT_INICIO_MAILING,
		A.ENDDATE AS DT_FIM_MAILING,
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
		B.HC_CPF_CNPJ__C AS ID,
		A.ID AS ID_CAMPANHA, 
		B.ID AS ID_CLIENTE_PARCEIRO,
		C.ID AS ID_CONTATO,
        D.ID AS TITULO_ID,
		DATEADD(DAY, A.HC_PROXIMA_EXECUCAO__C,A.HC_DATA_DE_EXECUCAO__C) AS DATA_PROXIMA_EXECUCAO,
		ROW_NUMBER() OVER(ORDER BY B.ID ASC) AS ROWNO
	FROM (
		SELECT
			  A.ID AS CAMPAIGN_ID,
			  B.ID AS RELACAO_CLIENTE_PARCEIRO_ID,
			  C.ID AS CONTACT_ID,
			  D.ID AS TITULO_ID,
			  ROW_NUMBER() OVER(PARTITION BY B.ID ORDER BY B.ID ASC) AS NUMBER_OF_CPF_REPETITION
			FROM CAMPAIGN_SALESFORCE A
			INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON 1 = 1
			INNER JOIN Contact_Salesforce C ON C.HC_CPF_CNPJ__c = B.HC_CPF_CNPJ__c
			INNER JOIN HC_TITULO__C_SALESFORCE D ON D.HC_CLIENTE_X_PARCEIRO__C = B.ID
			LEFT JOIN [AeM_Fim_Plano_PU_semOTC_Historico] H ON H.TITULO_ID = D.ID
			WHERE
				A.Id = '7016g00000075QNAAY'
			AND A.ISACTIVE = 1
      AND (A.HC_PARCEIRO__C = B.HC_PARCEIRO__C OR A.HC_PARCEIRO__C IS NULL)
			/* AND CONVERT(VARCHAR(10), A.HC_DATA_DE_EXECUCAO__C, 101) = CONVERT(VARCHAR(10), GETDATE(), 101)
					AND DATEPART(HH, A.HC_DATA_DE_EXECUCAO__C) = DATEPART(HH, GETDATE()) */
			AND D.HC_Fim_previsto__c BETWEEN HC_Data_inicial_do_periodo_de_resgate__c AND HC_Data_fim_do_periodo_de_resgate__c
				/* Não repetição de comunicação para titulo já comunicado */
			AND H.TITULO_ID IS NULL
			AND D.HC_SITUACAO__C IN ('Em processo de finalização', 'Finalizado - Fim de plano')
			AND D.HC_TIPO_DE_PAGAMENTO__C = ('PU')
			AND (B.HC_TIPO_DE_PESSOA__C = A.HC_TIPO_DE_CLIENTE__C OR A.HC_TIPO_DE_CLIENTE__C = 'PF E PJ')
			AND B.HC_CLASSIFICACAO__C = 'Cliente'
			AND B.HC_Idade__c BETWEEN 18 AND 70
			AND B.HC_PEP__C = 0
			AND B.HC_CONSELHEIRO__C = 0
			/* AND (ISNULL(B.HC_NAO_IMPORTUNE__C, 0) = 0 OR A.HC_VALIDA_NAO_IMPORTUNE__C = 0) */
			AND ( ISNULL(B.HC_NAO_DESEJA_RECEBER_TODOS_MEIOS__C, 0) = 0)
            AND (
                    /* Pode receber e-mail */
                ( ISNULL(B.HC_NAO_DESEJA_RECEBER_EMAIL__C, 0) = 0 AND ( B.HC_EMAIL_BRASILCAP__C IS NOT NULL OR B.HC_EMAIL_COMERCIAL__C IS NOT NULL OR B.HC_EMAIL_PESSOAL__C IS NOT NULL ) )
                    /* ou pode receber sms */
                OR ( ISNULL(B.HC_NAO_DESEJA_RECEBER_SMS__C, 0) = 0 AND (B.HC_STATUS_CELULAR_1__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_2__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_3__C = 'VÁLIDO' 
                    OR B.HC_STATUS_CELULAR_3_3__C = 'VÁLIDO' OR B.HC_STATUS_CELULAR_4__C = 'VÁLIDO') )
            )
        ) FILTERED
	INNER JOIN CAMPAIGN_SALESFORCE A ON A.ID = FILTERED.CAMPAIGN_ID
	INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON B.ID = FILTERED.RELACAO_CLIENTE_PARCEIRO_ID
	INNER JOIN CONTACT_SALESFORCE C ON C.ID = FILTERED.CONTACT_ID
	INNER JOIN HC_TITULO__C_SALESFORCE D ON D.ID = FILTERED.TITULO_ID
	WHERE FILTERED.NUMBER_OF_CPF_REPETITION = 1
) BASE
INNER JOIN
  CAMPAIGN_SALESFORCE CAMP 
  ON BASE.ID_CAMPANHA = CAMP.ID