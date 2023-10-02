SELECT DISTINCT
a.Id,
a.HC_Agendamento__c,
a.HC_Chave_CxP_Subscritor__c,
a.HC_Codigo_do_Parceiro__c,
a.HC_Codigo_do_Produto__c, 
a.HC_Data_da_Venda__c, 
a.HC_Forma_de_Credito_Formula__c, 
a.HC_Situacao__c,
a.HC_Valor__c AS Valor_da_Parcela,
b.HC_Classificacao__c AS Tipo_de_Cliente,
b.HC_Nao_deseja_receber_Email__c  AS NAO_DESEJA_RECEBER_EMAIL,
b.HC_Nao_Importune__c AS NAO_IMPORTUNE,
b.HC_Nao_deseja_receber_SMS__c AS NAO_DESEJA_RECEBER_SMS,
b.CPF_CNPJ_Cliente__c AS CPF_CNPJ,
b.HC_Celular_1__c AS HC_Celular_1__c,
LEFT(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_TELEFONE_RESIDENCIAL__c, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_01,
SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_TELEFONE_RESIDENCIAL__c, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_01,
'FIXO' AS TIPO_TEL_01,
LEFT(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_TELEFONE_COMERCIAL__c, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_02,
SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_TELEFONE_COMERCIAL__c, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_02,
'FIXO' AS TIPO_TEL_02,
LEFT(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_TELEFONE_OUTRO__c, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_03,
SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_TELEFONE_OUTRO__c, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_03,
'FIXO' AS TIPO_TEL_03,
LEFT(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_CELULAR_1__c, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_04,
SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_CELULAR_1__c, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_04,
'MÓVEL' AS TIPO_TEL_04,
LEFT(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_CELULAR_2__c, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_05,
SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_CELULAR_2__c, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_05,
'MÓVEL' AS TIPO_TEL_05,
LEFT(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_CELULAR_3__c, '(', ''), ')', ''), ' ', ''), '-', ''), 2) AS DDD_TEL_06,
SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(b.HC_CELULAR_3__c, '(', ''), ')', ''), ' ', ''), '-', ''), 3, 9) AS TEL_06,
'MÓVEL' AS TIPO_TEL_06,
b.HC_Status_Celular_1__c,
b.HC_Status_Celular_2__c,
b.HC_Status_Celular_3__c,
b.HC_Nome_Cliente__c AS Nome,
b.HC_IDADE__C AS Idade,
b.HC_CONSELHEIRO__C AS Conselheiro,
b.HC_PEP__C AS Cliente_PEP,
c.HC_Familia_do_Produto__c,
c.Name,

'Br' AS LOCALE

FROM HC_Proposta__c_Salesforce A
JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce B
ON a.HC_Titular__c = b.Id
JOIN HC_Produto__c_Salesforce C
ON a.HC_Produto_Relacionado__c = c.Id

WHERE c.HC_Familia_do_Produto__c = 'Ourocap'
AND a.HC_Situacao__c = 'Não Paga'
AND a.CreatedDate >= DATEADD(DAY, -60, GETDATE())
