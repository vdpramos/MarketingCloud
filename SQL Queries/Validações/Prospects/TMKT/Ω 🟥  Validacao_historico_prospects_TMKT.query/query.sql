select
a.CPF,
a.Nome,
a.Agencia,
a.Conta,
a.Tipo_Conta,
a.Sexo,
a.CEP,
a.DDD_01,
a.TEL_01,
a.DDD_02,
a.TEL_02,
a.DDD_03,
a.TEL_03,
a.DDD_04,
a.TEL_04,
a.DDD_05,
a.TEL_05,
a.Data_Arquivo,
a.Fornecedor,
a.Data_Nascimento,
b.Data_Participacao_Campanha
from
Prospect_ComOTC_TMKT_Validacao_Base_2 a
inner join Tb_Base_Quarentena b on a.CPF = b.CPF_CNPJ