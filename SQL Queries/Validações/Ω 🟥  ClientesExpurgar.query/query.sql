select id, 1 as Enviado
from ClientesServiceCAP cs
where not exists (select 1 from cliente c where c.CPF_CNPJ_PARCEIRO = cs.CPF_CNPJ_PARCEIRO )
      and cpf_cnpj_parceiro not in (select cpf_cnpj_parceiro from ClientesComReclamacaoOuvidoria)
            