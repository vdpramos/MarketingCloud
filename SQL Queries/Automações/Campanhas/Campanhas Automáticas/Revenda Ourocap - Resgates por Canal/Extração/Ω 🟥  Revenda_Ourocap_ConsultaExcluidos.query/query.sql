select T.* 
from Revenda_Ourocap_Otc291_TRATADA T
left join Revenda_Ourocap_Otc291_FILTRADA F
    ON T.Id_Contato = F.Id_Contato
where F.Ind_MembroCampanha is null