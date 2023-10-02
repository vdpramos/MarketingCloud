SELECT CASE WHEN C.HC_SITUACAO__C = 'Ativo' THEN 1 ELSE 0 END AS Possui_Titulo_Ativo,
       CASE WHEN DATEDIFF(DD,C.HC_CONTRATACAO__C, GETDATE()) <= 30 THEN 1 ELSE 0 END AS Compra_Utimos_30_Dias,
        B.ID
FROM Tb_Base_Ex_Cliente_ComOTC_NeoBpo B
INNER JOIN HC_TITULO__C_SALESFORCE C ON B.ID = C.HC_CLIENTE_X_PARCEIRO__C
