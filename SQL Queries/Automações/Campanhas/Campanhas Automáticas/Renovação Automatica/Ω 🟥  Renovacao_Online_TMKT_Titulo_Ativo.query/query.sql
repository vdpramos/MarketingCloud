SELECT
    max(CASE    when C.HC_CLIENTE_X_PARCEIRO__C is null then 
                    0 
                WHEN DATEDIFF(DD,C.HC_CONTRATACAO__C, GETDATE()) <= 90 THEN    
                    1 
                ELSE 
                    0 
                END) AS Titulo_Ativo_Recente,
    B.CPF
FROM Renovacao_Online_Tratada_TMKT B
LEFT JOIN HC_TITULO__C_SALESFORCE C 
    ON B.ID_CLIENTE_PARCEIRO = C.HC_CLIENTE_X_PARCEIRO__C
group by cpf