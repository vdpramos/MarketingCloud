select
  b.cpf_cnpj as cpf,
  b.id,
  b.Id_campanha,
  b.id_contato as id_contado,
  b.CPF_CNPJ_Codigo_do_Parceiro as CPF_CNPJ_Codigo_do_Parceiro,
  Left(B.NOME, CharIndex(' ', B.NOME)) AS PRIMEIRO_NOME,
  Reverse(Left(Reverse(B.Nome), CharIndex(' ', Reverse(B.Nome)))) AS SOBRENOME,
  CONCAT(b.cpf_cnpj,'Cliente') as CPF_Tipo_Relacionamento,
  b.Id_Cliente_Parceiro
from [Ex-cliente Neo CPFs] a
inner join Tb_Base_Ex_Cliente_ComOTC_neobpo b on a.cpf = b.cpf_cnpj