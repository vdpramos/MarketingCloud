SELECT
  a.CPF,
  b.Data_Participacao_Campanha
FROM TB_BASE_PROSPECT_COMOTC_TRATADA_TMKT a
inner join Tb_Base_Quarentena b on a.CPF = b.CPF_CNPJ