SELECT
    max(CASE when C.HC_CLIENTE_X_PARCEIRO__C is null then 0 WHEN DATEDIFF(DD,C.HC_CONTRATACAO__C, GETDATE()) <= 90 THEN 1 ELSE 0 END) AS Titulo_Ativo_Recente,
    B.CPF
FROM Tb_Base_Prospect_ComOTC_Online_Tratada_NeoBpo_Pub3 B
LEFT JOIN HC_TITULO__C_SALESFORCE C ON B.ID_CLIENTE_PARCEIRO = C.HC_CLIENTE_X_PARCEIRO__C
group by cpf