SELECT CASE WHEN C.HC_SITUACAO__C IN ('Ativo', 'Em processo de finalização', 'Em processo de Reativação', 'Suspenso') THEN 1 ELSE 0 END AS Possui_Titulo_Ativo,
       CASE WHEN DATEDIFF(DD,C.HC_CONTRATACAO__C, GETDATE()) <= 30 THEN 1 ELSE 0 END AS Compra_Utimos_30_Dias,
        B.ID
FROM Tb_Recuperacao_Caducidade_Publico_Inicial  B
left JOIN HC_TITULO__C_SALESFORCE C ON B.ID_CLIENTE_PARCEIRO = C.HC_CLIENTE_X_PARCEIRO__C




