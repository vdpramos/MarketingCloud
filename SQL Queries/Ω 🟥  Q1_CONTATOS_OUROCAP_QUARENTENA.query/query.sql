SELECT DISTINCT
    a.CPF_CNPJ
FROM
    Tb_Base_Fim_Plano_Ourocap_PU_PP_OTC291_Filtrada_NeoBpo A 
Inner join
    Tb_Base_Quarentena B ON A.CPF_CNPJ = B.CPF_CNPJ