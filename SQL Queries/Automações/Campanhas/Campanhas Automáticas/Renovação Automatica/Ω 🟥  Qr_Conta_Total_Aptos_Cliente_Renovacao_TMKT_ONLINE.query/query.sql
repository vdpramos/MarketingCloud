select
  b.ID_CAMPANHA,
  count(1) as QUANTIDADE_ATUAL_290
from Publico_Apto_Clientes_Renovacao_TMKT_ONLINE a
inner join CONTROLE_AUTOMACOES_CAMPANHAS b on b.ID_CAMPANHA = '7016g000000B5LZAA0'
group by  b.ID_CAMPANHA