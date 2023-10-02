select bs.CPF_CNPJ, cc.Classificacao as Cliente
from BaseSusep_Enriquecimento bs
inner join ClassificacaoPorCPF cc
    on bs.cpf_cnpj = cc.cpf_cnpj