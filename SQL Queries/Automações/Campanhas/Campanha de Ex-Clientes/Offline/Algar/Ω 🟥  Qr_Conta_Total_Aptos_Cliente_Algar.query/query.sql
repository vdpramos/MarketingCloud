select
  b.ID_CAMPANHA,
  count(1) as QUANTIDADE_ATUAL_290
from Publico_Apto_Ex_Clientes_Algar a
inner join CONTROLE_AUTOMACOES_CAMPANHAS b on b.ID_CAMPANHA = '7016g000000NSIuAAO'
group by  b.ID_CAMPANHA