SELECT
    B.HC_CPF_CNPJ__c AS CPF,
    MAX(B.HC_Nome_Cliente__c) AS Nome,
    MAX(B.HC_Data_de_Nascimento__c) AS DataNascimento,
    MAX(B.HC_Cidade_Res__c) AS Cidade,
    MAX(B.HC_CEP_Res__c) AS CEP,
    MAX(B.HC_UF_Res__c) AS UF,
    MAX(B.HC_Tipo_de_Pessoa__c) AS TipoPessoa,
	MAX(B.HC_Celular_1__c) AS Celular1,
	MAX(B.HC_Celular_2__c) AS Celular2,
	MAX(CASE
		    WHEN B.HC_Celular_3__c IS NOT NULL THEN B.HC_Celular_3__c
		    WHEN B.HC_Celular_3_3__c IS NOT NULL THEN B.HC_Celular_3_3__c
		    ELSE B.HC_Celular_4__c
	    END) AS Celular3,
	MAX(B.HC_Telefone_Residencial__c) AS Fixo1,
	MAX(B.HC_Telefone_Comercial__c) AS Fixo2,
	MAX(B.HC_Telefone_Outro__c) AS Fixo3,
	MAX(B.HC_Email_Pessoal__c) AS EMailPessoal,
	MAX(B.HC_Email_Comercial__c) AS EMailComercial,
	MAX(B.HC_Email_Brasilcap__c) AS EMailBrasilcap,
	MAX(B.HC_Email_Principal__c) AS EmailPrincipal,
	'POSTALCAP' AS Parceiro
FROM  HC_Relacao_Cliente_Parceiro__c_Salesforce B
LEFT JOIN HC_Titulo__c_Salesforce A ON A.HC_Cliente__c = B.HC_Cliente__c
WHERE
    A.HC_Familia_do_produto_do_titulo__c = 'PostalCap'
AND B.HC_Tipo_de_Pessoa__c = 'PF'
AND (B.HC_Email_Pessoal__c IS NOT NULL OR B.HC_Email_Comercial__c IS NOT NULL OR B.HC_Email_Brasilcap__c IS NOT NULL)
GROUP BY
    B.HC_CPF_CNPJ__c