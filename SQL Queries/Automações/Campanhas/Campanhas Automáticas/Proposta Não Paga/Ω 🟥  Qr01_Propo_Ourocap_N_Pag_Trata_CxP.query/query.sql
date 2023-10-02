SELECT
	A.HC_CPF_CNPJ__C AS ID,
    /* CASE WHEN A.HC_CONSELHEIRO__C = 1 THEN 1 ELSE 0 END AS CONSELHEIRO, */
    /* CASE WHEN A.HC_PEP__C = 1 THEN 1 ELSE 0 END AS CLIENTE_PEP, */
    /* CASE WHEN A.HC_NAO_DESEJA_RECEBER_LIGACOES__C = 1 THEN 1 ELSE 0 END AS DESEJA_CONTATO_TELEFONICO, */
    /* CASE WHEN A.HC_IDADE__C BETWEEN 18 AND 70 THEN 1 ELSE 0 END AS IDADE_VALIDA, */
	/* 06-10-2021 TODOS OS TELEFONES TEM QUE SER VÁLIDOS NESSA JORNADA */
    CASE WHEN (LEN(CONCAT(B.DDD_TEL_01,B.TEL_01)) = 10 OR LEN(CONCAT(B.DDD_TEL_02,B.TEL_02)) = 10 OR LEN(CONCAT(B.DDD_TEL_03,B.TEL_03)) = 10
     OR LEN(CONCAT(B.DDD_TEL_04,B.TEL_04)) = 11 OR LEN(CONCAT(B.DDD_TEL_05,B.TEL_05)) = 11 OR LEN(CONCAT(B.DDD_TEL_06,B.TEL_06)) = 11) THEN 1 ELSE 0 END AS POSSUI_TELEFONE_ATIVO,
	CASE WHEN A.HC_Status_Tel_Residencial__c = 'Inválido' THEN '' ELSE B.DDD_TEL_01 END AS DDD_TEL_01,
	CASE WHEN A.HC_Status_Tel_Residencial__c = 'Inválido' THEN '' ELSE B.TEL_01 END AS TEL_01,
	CASE WHEN A.HC_Status_Tel_Comercial__c = 'Inválido' THEN '' ELSE B.DDD_TEL_02 END AS DDD_TEL_02,
	CASE WHEN A.HC_Status_Tel_Comercial__c = 'Inválido' THEN '' ELSE B.TEL_02 END AS TEL_02,
	CASE WHEN A.HC_Status_Tel_Outro__c = 'Inválido' THEN '' ELSE B.DDD_TEL_03 END AS DDD_TEL_03,
	CASE WHEN A.HC_Status_Tel_Outro__c = 'Inválido' THEN '' ELSE B.TEL_03 END AS TEL_03,
	CASE WHEN A.HC_Status_Celular_1__c = 'Inválido' THEN '' ELSE B.DDD_TEL_04 END AS DDD_TEL_04,
	CASE WHEN A.HC_Status_Celular_1__c = 'Inválido' THEN '' ELSE B.TEL_04 END AS TEL_04,
	CASE WHEN A.HC_Status_Celular_2__c = 'Inválido' THEN '' ELSE B.DDD_TEL_05 END AS DDD_TEL_05,
	CASE WHEN A.HC_Status_Celular_2__c = 'Inválido' THEN '' ELSE B.TEL_05 END AS TEL_05,
	CASE WHEN A.HC_Status_Celular_3__c = 'Inválido' THEN '' ELSE B.DDD_TEL_06 END AS DDD_TEL_06,
	CASE WHEN A.HC_Status_Celular_3__c = 'Inválido' THEN '' ELSE B.TEL_06 END AS TEL_06,
	CASE 
	    WHEN (A.HC_BANCO_1__C IS NOT NULL AND A.HC_AGENCIA_1__c IS NOT NULL AND A.HC_NUMERO_DA_CONTA_1__c IS NOT NULL) THEN 1
        WHEN (A.HC_BANCO_2__C IS NOT NULL AND A.HC_AGENCIA_2__c IS NOT NULL AND A.HC_NUMERO_DA_CONTA_2__c IS NOT NULL) THEN 1
        ELSE 0
    END AS POSSUI_CONTA_CORRENTE
FROM
    HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE A
INNER JOIN Tb_Base_Prop_Ourocap_N_Pag B ON A.HC_CPF_CNPJ__C = B.CPF_CNPJ