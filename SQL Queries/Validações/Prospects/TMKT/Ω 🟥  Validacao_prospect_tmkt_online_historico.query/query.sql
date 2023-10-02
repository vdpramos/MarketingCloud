select
CPF_CNPJ,
CAMPANHA,
RESULTADO,
DATA_REGISTRO
from
Tb_Log_Resultados_de_Avaliacao
where
CAMPANHA = 'Campanha Online PROSPECT - TMKT'
and
convert(varchar, DATA_REGISTRO, 120) > '2022-12-28 11:00:00'
and
convert(varchar, DATA_REGISTRO, 120) < '2022-12-29 00:00:00'