select
otc291.*
from Tb_Base_Prospect_Online_Extracao_ComOTC_NeoBpo_Pub1 ext
inner join Tb_Base_Prospect_OTC291_Online_Tratada_NeoBpo_Pub1 otc291 on ext.CPF_CNPJ = otc291.CPF
where otc291.CODIGO_RNA = '000'
  and otc291.ALTA_RENDA = 0