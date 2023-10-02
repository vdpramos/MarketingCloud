select p.cpf
from CPF_Andre p
where not exists (select 1 from Close_the_loop_compradores c where p.cpf = c.CPF_CNPJ )