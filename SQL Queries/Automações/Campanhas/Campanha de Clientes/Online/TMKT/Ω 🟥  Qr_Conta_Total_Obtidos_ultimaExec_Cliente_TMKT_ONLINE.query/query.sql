select
  b.ID_CAMPANHA,
  count(1) as QUANTIDADE_OBTIDA_ULTIMA_EXEC_OTC290
from Tb_Base_Cliente_TMKT_ONLINE a
inner join CONTROLE_AUTOMACOES_CAMPANHAS b on b.ID_CAMPANHA = '7016g000000NnI2AAK'
group by  b.ID_CAMPANHA