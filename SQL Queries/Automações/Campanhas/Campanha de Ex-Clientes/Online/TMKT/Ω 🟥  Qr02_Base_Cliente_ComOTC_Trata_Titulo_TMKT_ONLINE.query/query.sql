SELECT  CASE WHEN C.HC_SITUACAO__C = 'Ativo' THEN 1 ELSE 0 END AS Possui_Titulo_Ativo,
        CASE when C.HC_CLIENTE_X_PARCEIRO__C is null then 0 WHEN DATEDIFF(DD,C.HC_CONTRATACAO__C, GETDATE()) <= 30 THEN 1 ELSE 0 END AS Compra_Utimos_30_Dias,
        CASE when   ((D.HC_Tipo_da_Conta_1__c = 'Conta Corrente' and D.HC_Numero_da_Conta_1__c != '000000000000') or
                    (HC_Tipo_da_Conta_2__c = 'Conta Corrente' and D.HC_Numero_da_Conta_2__c != '000000000000')) THEN 1 ELSE 0 END AS Conta_Apta, 
        B.ID
FROM Tb_Base_Ex_Cliente_ComOTC_TMKT_ONLINE B
LEFT JOIN HC_TITULO__C_SALESFORCE C ON B.ID_CLIENTE_PARCEIRO = C.HC_CLIENTE_X_PARCEIRO__C
LEFT JOIN HC_Relacao_Cliente_Parceiro__c_Salesforce D ON B.ID_CLIENTE_PARCEIRO = D.ID
