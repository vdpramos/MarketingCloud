SELECT
A.CPF_CNPJ,
C.HC_Valor_Liquido__c as Valor_Resgate,
C.NAME as Numero_do_Titulo,
C.HC_Fim_previsto__c as Data_Credito,
C.HC_Meio_de_Credito__c as Forma_Credito,
D.HC_Descricao__c AS Produto
FROM Fim_Plano_PM_semOTC_Filtrado A
INNER JOIN HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE B ON A.CPF_CNPJ = B.HC_CPF_CNPJ__c
INNER JOIN HC_TITULO__C_SALESFORCE C ON C.HC_CLIENTE_X_PARCEIRO__C = B.ID
INNER JOIN HC_PRODUTO__C_SALESFORCE D ON C.HC_produtoRelacionado__c = D.ID
WHERE CONVERT(VARCHAR(10), C.HC_Fim_previsto__c, 120) = CONVERT(VARCHAR(10), getdate()+20, 120)