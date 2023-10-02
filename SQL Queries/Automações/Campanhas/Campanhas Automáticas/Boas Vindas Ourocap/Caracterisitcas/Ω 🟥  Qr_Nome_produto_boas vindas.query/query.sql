SELECT
    A.Name AS Nome_produto
,   A.HC_Plano__c as Plano_do_Titulo
,   B.CPF_CNPJ
FROM
    HC_Produto__c_Salesforce A
RIGHT JOIN 
    TB_BOAS_VINDAS_OUROCAP_CLIENTES_E_TITULOS B ON A.HC_Plano__c = B.Plano_do_Titulo
