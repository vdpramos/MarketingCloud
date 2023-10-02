SELECT DISTINCT
  HC_Id_Parceiro_Cap__c AS COD_PARCEIRO,
  A.CPF,
  '' AS CNPJ,
  CASE 
    WHEN D.HC_Conta_Principal__c = 'CONTA 1' THEN HC_Banco_1__c 
    WHEN D.HC_Conta_Principal__c = 'CONTA 2' THEN HC_Banco_2__c 
  END AS BANCO,
  CASE 
    WHEN D.HC_Conta_Principal__c = 'CONTA 1' THEN HC_Agencia_1__c 
    WHEN D.HC_Conta_Principal__c = 'CONTA 2' THEN HC_Agencia_2__c 
  END AS AGENCIA,
  /*CASE 
    WHEN D.HC_Conta_Principal__c = 'CONTA 1' THEN HC_Digito_da_Agencia_1__c
    WHEN D.HC_Conta_Principal__c = 'CONTA 2' THEN HC_Digito_da_Agencia_2__c 
  END AS Digito_Verificador_Agencia,*/
  CASE 
    WHEN D.HC_Conta_Principal__c = 'CONTA 1' THEN HC_Numero_da_Conta_1__c
    WHEN D.HC_Conta_Principal__c = 'CONTA 2' THEN HC_Numero_da_Conta_2__c 
  END AS CONTA_CORRENTE,
  /*CASE 
    WHEN D.HC_Conta_Principal__c = 'CONTA 1' THEN HC_Digito_da_Conta_1__c
    WHEN D.HC_Conta_Principal__c = 'CONTA 2' THEN HC_Digito_da_Conta_2__c 
  END AS Digito_Verificador_Conta,
  CASE 
    WHEN D.HC_Conta_Principal__c = 'CONTA 1' THEN HC_Terceiro_Digito_Conta_Corrente_1__c
    WHEN D.HC_Conta_Principal__c = 'CONTA 2' THEN HC_Terceiro_Digito_Conta_Corrente_2__c 
  END AS Agencia_Conta_Digito_Verificador,*/
  'CC' AS Tipo_Conta
FROM
  Tb_Base_Ex_Cliente_OTC291_Filtrada_Algar A 
INNER JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce D
    ON A.ID_CLIENTE_PARCEIRO = D.ID