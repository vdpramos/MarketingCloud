select distinct b.*
from Tb_Base_Prospect_Online_Filtrada_TMKT a
inner join Tb_Base_OTC291_Tratada_Historico b
    on a.cpf = b.cpf