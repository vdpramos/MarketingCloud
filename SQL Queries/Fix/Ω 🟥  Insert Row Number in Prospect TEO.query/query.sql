select
a.cpf,
row_number() over(order by a.cpf) as row
from Tb_Base_Prospect_OTC291_Filtrada_Teo a