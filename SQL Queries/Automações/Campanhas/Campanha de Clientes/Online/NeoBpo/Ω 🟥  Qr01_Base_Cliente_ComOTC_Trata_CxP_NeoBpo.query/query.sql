SELECT
	A.HC_CPF_CNPJ__C AS ID,
    CASE WHEN A.HC_CONSELHEIRO__C = 1 THEN 1 ELSE 0 END AS CONSELHEIRO,
    CASE WHEN A.HC_PEP__C = 1 THEN 1 ELSE 0 END AS CLIENTE_PEP,
    CASE WHEN A.HC_NAO_DESEJA_RECEBER_LIGACOES__C = 1 THEN 1 ELSE 0 END AS DESEJA_CONTATO_TELEFONICO,
    CASE WHEN A.HC_IDADE__C BETWEEN 18 AND 70 THEN 1 ELSE 0 END AS IDADE_VALIDA,
    CASE WHEN (LEN(CONCAT(B.DDD_TEL_01,B.TEL_01)) = 10 OR LEN(CONCAT(B.DDD_TEL_02,B.TEL_02)) = 10 OR LEN(CONCAT(B.DDD_TEL_03,B.TEL_03)) = 10
     OR LEN(CONCAT(B.DDD_TEL_04,B.TEL_04)) = 11 OR LEN(CONCAT(B.DDD_TEL_05,B.TEL_05)) = 11 OR LEN(CONCAT(B.DDD_TEL_06,B.TEL_06)) = 11) THEN 1 ELSE 0 END AS POSSUI_TELEFONE_ATIVO,
	CASE 
	    WHEN (A.HC_BANCO_1__C IS NOT NULL AND A.HC_AGENCIA_1__c IS NOT NULL AND A.HC_NUMERO_DA_CONTA_1__c IS NOT NULL) THEN 1
        WHEN (A.HC_BANCO_2__C IS NOT NULL AND A.HC_AGENCIA_2__c IS NOT NULL AND A.HC_NUMERO_DA_CONTA_2__c IS NOT NULL) THEN 1
        ELSE 0
    END AS POSSUI_CONTA_CORRENTE
FROM
    HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE A
INNER JOIN TB_BASE_CLIENTE_COMOTC_NEOBPO B ON A.HC_CPF_CNPJ__C = B.CPF_CNPJ