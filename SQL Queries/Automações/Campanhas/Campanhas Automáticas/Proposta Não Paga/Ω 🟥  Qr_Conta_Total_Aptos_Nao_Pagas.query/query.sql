select
  b.ID_CAMPANHA,
  count(1) as QUANTIDADE_ATUAL_290
from Publico_Apto_Nao_Pagas a
inner join CONTROLE_AUTOMACOES_CAMPANHAS b on b.ID_CAMPANHA = '7016g000002O08TAAS'
group by  b.ID_CAMPANHA