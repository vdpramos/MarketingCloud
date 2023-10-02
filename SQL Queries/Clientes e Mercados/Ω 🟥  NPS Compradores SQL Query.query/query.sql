SELECT
    A.HC_Cliente_x_Parceiro__c AS ClienteID,
    A.HC_CPF_CNPJ_Subscritor__c AS CPF,
    B.HC_Nome_Cliente__c AS Nome,
    B.HC_Data_de_Nascimento__c AS DataNascimento,
    A.HC_Cidade_Subscritor__c AS Cidade,
    B.HC_CEP_Res__c AS CEP,
    A.HC_Estado_Titular__c AS UF,
    B.HC_Tipo_de_Pessoa__c AS TipoPessoa,
    A.HC_Nome_Completo__c AS ChaveTitulo,    
    A.HC_Situacao__c AS StatusTitulo,
    A.HC_Inicio__c AS InicioVigencia,
    A.HC_Fim_previsto__c AS FimVigencia,
    A.HC_Valor_da_Parcela__c AS ValorParcela,
    A.HC_Proposta__c AS NumeroProposta,
    A.HC_Origem_da_Venda__c AS OrigemVenda,
    A.HC_Tipo_de_pagamento__c AS TipoPagamento,
	B.HC_Celular_1__c AS Celular1,
	B.HC_Celular_2__c AS Celular2,
	CASE
		WHEN B.HC_Celular_3__c IS NOT NULL THEN B.HC_Celular_3__c
		WHEN B.HC_Celular_3_3__c IS NOT NULL THEN B.HC_Celular_3_3__c
		ELSE B.HC_Celular_4__c
	END AS Celular3,
	B.HC_Telefone_Residencial__c AS Fixo1,
	B.HC_Telefone_Comercial__c AS Fixo2,
	B.HC_Telefone_Outro__c AS Fixo3,
	B.HC_Email_Pessoal__c AS EMailPessoal,
	B.HC_Email_Comercial__c AS EMailComercial,
	B.HC_Email_Brasilcap__c AS EMailBrasilcap,
	B.HC_Email_Principal__c AS EmailPrincipal,
	B.HC_Nao_deseja_receber_Email__c AS NaoReceberEmail,
	A.HC_Origem__c,
	A.HC_CODIGO_DO_PARCEIRO_NA_ORIGEM__C,
	A.HC_FAMILIA_DO_PRODUTO_DO_TITULO__C
FROM HC_Titulo__c_Salesforce A
LEFT JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce B ON B.HC_Cliente__c = A.HC_Cliente__c
WHERE
    HC_Familia_do_produto_do_titulo__c = 'Ourocap'
AND B.HC_Tipo_de_Pessoa__c = 'PF'
AND A.HC_Inicio__c BETWEEN '2023-06-21' AND '2023-07-20'
AND (B.HC_Id_Parceiro_Cap__c = 'TCBB' OR B.HC_Id_Parceiro_Darwin__c = '1')
AND HC_Nao_deseja_receber_Ligacoes__c = 0
AND HC_Nao_deseja_receber_Todos_Meios__c = 0