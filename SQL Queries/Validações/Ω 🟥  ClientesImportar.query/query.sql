select c.CPF_CNPJ_PARCEIRO, c.PARCEIRO, c.CPF_CNPJ
from cliente c
where not exists (select 1 from ClientesServiceCAP cs where c.CPF_CNPJ_PARCEIRO = cs.CPF_CNPJ_PARCEIRO )
            