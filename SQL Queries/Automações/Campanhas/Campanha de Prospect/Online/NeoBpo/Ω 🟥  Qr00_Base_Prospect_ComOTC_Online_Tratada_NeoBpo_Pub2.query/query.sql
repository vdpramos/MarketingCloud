SELECT DISTINCT
    UPPER (replace(replace(replace( replace( replace( replace( replace( replace( replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (NOME, 'á', 'a'),'é', 'e'),'í', 'i'),'ó', 'o'),'ú', 'u'),'Á', 'A'),'É', 'E'),'Í', 'I'),'Ó', 'O'),'Ú', 'U'),'à', 'a'),'À', 'A'),'ã', 'a'),'õ', 'o'),'Ã', 'A'),  'Õ', 'O'),'â', 'a'),'ê', 'e'),'ô', 'o'),'Â', 'A'),'Ê', 'E'),'Ô', 'O'),'ç', 'c'),'Ç', 'c') , '-', '') , '+', '') , '|', '') , '$', '') , '%', '') , '&', '') , '¦', ''),'''', ' ')) as NOME,
	RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, A.CPF), 11) AS CPF,
	A.AGENCIA,
	A.CONTA,
	A.TIPO_CONTA,
	A.DATA_NASCIMENTO,
	A.SEXO,
	A.CEP,
	A.DDD_01,
	A.TEL_01,
	A.DDD_02,
	A.TEL_02,
	A.DDD_03,
	A.TEL_03,
	A.DDD_04,
	A.TEL_04,
	A.DDD_05,
	A.TEL_05,
	A.Dia_Prov,
	CL.HC_Banco_1__c as Banco,
	CL.HC_Digito_da_Agencia_1__c as Digito_Verificador_Agencia,
	CL.HC_Digito_da_Conta_1__c AS Digito_Verificador_Conta,
	CL.HC_Terceiro_Digito_Conta_Corrente_1__c as Agencia_Conta_Digito_Verificador,
  CA.ID AS ID_CAMPANHA,
  CA.HC_PRODUTO__C AS NOME_PRODUTO,
  CA.HC_PRECO_DO_PRODUTO__C AS NOME_PRODUTO_VALOR,
  CA.HC_VALIDA_ALTA_RENDA__C AS VALIDA_ENCARTEIRAMENTO,
  CA.HC_VALIDA_NAO_IMPORTUNE__C AS VALIDA_NAO_IMPORTUNE,
  CA.HC_VALIDA_RNA__C AS VALIDA_RNA,
  CL.ID as ID_CLIENTE_PARCEIRO,
  CASE WHEN DATEDIFF(YY, CAST(A.DATA_NASCIMENTO AS DATE), GETDATE()) BETWEEN 18 AND 70 THEN 1 ELSE 0 END AS IDADE_VALIDA,
  CASE WHEN (UPPER(A.TIPO_CONTA) = 'CC' OR UPPER(A.TIPO_CONTA) = 'CONTA CORRENTE') THEN 1 ELSE 0 END AS CONTA_CORRENTE,
  CASE WHEN Q.CPF_CNPJ IS NOT NULL AND Q.DATA_PARTICIPACAO_CAMPANHA > DATEADD(DD, -90, GETDATE()) THEN 1 ELSE 0 END AS QUARENTENA, 
  CASE WHEN CL.HC_CPF_CNPJ__C IS NOT NULL AND PAR.NAME = 'BB CORRETORA - 52' THEN 1 ELSE 0 END AS CLIENTE,
  CASE WHEN CL.HC_CPF_CNPJ__C IS NOT NULL AND CL.HC_CONSELHEIRO__C = 1 THEN 1 ELSE 0 END AS CONSELHEIRO,
CASE WHEN ISNULL(A.CEP, '') = '' OR A.CEP = ' ' THEN 0 ELSE 1 END AS CEP_VALIDO
FROM TB_BASE_PROSPECT_COMOTC_ONLINE_NEOBPO_PUB2 A
INNER JOIN CAMPAIGN_SALESFORCE CA ON A.FORNECEDOR = CA.HC_FORNECEDOR__c
LEFT JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE CL ON RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, A.CPF), 11) = CL.HC_CPF_CNPJ__C
LEFT JOIN HC_PARCEIRO__C_SALESFORCE PAR ON PAR.ID = CL.HC_PARCEIRO__C
LEFT JOIN TB_BASE_QUARENTENA Q ON RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, A.CPF), 11) = Q.CPF_CNPJ
WHERE
    CA.HC_FORNECEDOR__C = 'NeoBpo'
/*AND CONVERT(VARCHAR, CA.HC_Data_de_Execucao__c, 112) = CONVERT(VARCHAR, GETDATE(), 112)*/
AND CA.[TYPE] = 'Prospect'
/*AND CA.HC_VALIDA_RNA__C = 1*/
AND CA.IsActive = 1
AND CA.Id = '7016g00000072rkAAA'
AND (
	/* Possui ao menos 1 telefone válido */
	(LEN(NULLIF(TEL_01, '')) < 10 AND NOT( LEN(TEL_01) = 8 AND TEL_01 LIKE '9%' ))
	OR (LEN(NULLIF(TEL_02, '')) < 10 AND NOT( LEN(TEL_02) = 8 AND TEL_02 LIKE '9%' ))
	OR (LEN(NULLIF(TEL_03, '')) < 10 AND NOT( LEN(TEL_03) = 8 AND TEL_03 LIKE '9%' ))
	OR (LEN(NULLIF(TEL_04, '')) < 10 AND NOT( LEN(TEL_04) = 8 AND TEL_04 LIKE '9%' ))
	OR (LEN(NULLIF(TEL_05, '')) < 10 AND NOT( LEN(TEL_05) = 8 AND TEL_05 LIKE '9%' ))
)