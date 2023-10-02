select distinct
a.CPF_CNPJ_Subscritor,
b.Id_contato
from
Validacao_close_the_loop_cpf_sem_nome a
inner join Close_the_loop_clientes_ativos b
on a.CPF_CNPJ_Subscritor = b.CPF_CNPJ