SELECT  
    A.Data_Participacao_Campanha,
    B.CPF_CNPJ
FROM
    Tb_Log_Resultados_de_Avaliacao A
LEFT JOIN
    Tb_Base_Quarentena B ON A.CPF_CNPJ = B.CPF_CNPJ