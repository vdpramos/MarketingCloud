SELECT
  A.*
FROM Revenda_Ourocap_OTC291_Tratada A
  /* CHECAGEM SE TOODS OS CONTATOS TIVERAM O OTC TRATADO */
LEFT OUTER JOIN ( 
      SELECT
        COUNT(1) as CPFS_FALTANDO_NO_OTC
      FROM Revenda_Ourocap_Filtrada ENV
      LEFT JOIN Revenda_Ourocap_OTC291_Tratada RET ON ENV.CPF_CNPJ = RET.CPF_CNPJ
      WHERE RET.CPF_CNPJ IS NULL
    ) B ON 1 = 1
WHERE A.CLIENTE_PEP = 0
        AND A.Codigo_RNA = '000'
        AND A.Compra_Recente_Ourocap = 0
        AND A.Conselheiro = 0
        AND A.Idade_Valida = 1
        AND A.Nao_deseja_receber_Ligacoes = 0
        AND A.Possui_Conta_Ativa = 1
        AND A.Alta_Renda = 0
        AND A.Possui_Telefone_Ativo = 1