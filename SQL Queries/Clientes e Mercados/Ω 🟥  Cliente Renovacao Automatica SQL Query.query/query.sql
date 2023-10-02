SELECT
    B.HC_Nome_Cliente__c AS Nome,
    B.HC_CPF_CNPJ__c AS CPF,
    B.HC_Agencia_1__c AS Agencia,
    B.HC_Numero_da_Conta_1__c AS Conta,
    B.HC_Digito_da_Conta_1__c AS DigitoConta,
    B.HC_Tipo_da_Conta_1__c AS TipoConta,
    B.HC_Data_de_Nascimento__c AS DataNascimento,
    B.HC_Genero_do_Cliente__c AS Sexo,
    B.HC_CEP_Res__c AS CEP,
    REPLACE(REPLACE(SUBSTRING(B.HC_Celular_1__c, 1, 4), '(', ''), ')', '') AS DDDCelular1,
    REPLACE(SUBSTRING(B.HC_Celular_1__c, 6, LEN(B.HC_Celular_1__c) - 5), '-', '') AS Celular1,
    REPLACE(REPLACE(SUBSTRING(B.HC_Celular_2__c, 1, 4), '(', ''), ')', '') AS DDDCelular2,
    REPLACE(SUBSTRING(B.HC_Celular_2__c, 6, LEN(B.HC_Celular_2__c) - 5), '-', '') AS Celular2,
    REPLACE(REPLACE(SUBSTRING(B.HC_Celular_3_3__c, 1, 4), '(', ''), ')', '') AS DDDCelular3,
    REPLACE(SUBSTRING(B.HC_Celular_3_3__c, 6, LEN(B.HC_Celular_3_3__c) - 5), '-', '') AS Celular3,
    REPLACE(REPLACE(SUBSTRING(B.HC_Telefone_Residencial__c, 1, 4), '(', ''), ')', '') AS DDDFixo1,
    REPLACE(SUBSTRING(B.HC_Telefone_Residencial__c, 6, LEN(B.HC_Telefone_Residencial__c) - 5), '-', '') AS Fixo1,
    REPLACE(REPLACE(SUBSTRING(B.HC_Telefone_Comercial__c, 1, 4), '(', ''), ')', '') AS DDDFixo2,
    REPLACE(SUBSTRING(B.HC_Telefone_Comercial__c, 6, LEN(B.HC_Telefone_Comercial__c) - 5), '-', '') AS Fixo2,
    REPLACE(REPLACE(SUBSTRING(B.HC_Telefone_Outro__c, 1, 4), '(', ''), ')', '') AS DDDFixo3,
    REPLACE(SUBSTRING(B.HC_Telefone_Outro__c, 6, LEN(B.HC_Telefone_Outro__c) - 5), '-', '') AS Fixo3
FROM HC_Relacao_Cliente_Parceiro__c_Salesforce B
WHERE
    B.HC_CPF_CNPJ__c IN (SELECT CPF FROM RenovacaoAutomaticaDE)
AND (B.HC_Id_Parceiro_Cap__c = 'TCBB' OR B.HC_Id_Parceiro_Darwin__c = '1')