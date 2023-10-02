select cpf_cnpj , getdate() as DATA_ENVIO
from BaseSusep_Enriquecimento bs
where bs.cliente = 'X'