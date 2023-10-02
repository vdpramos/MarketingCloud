SELECT
  a.CPF AS CPF_CNPJ,
  a.Id_contato,
  a.Id_Cliente_Parceiro,
  a.Nome,
  a.Dt_Nascimento AS Data_Nascimento,
  a.Email,
  a.Celular,
  a.MCI,
  a.Tipo_Carteira,
  a.Encarteiramento
FROM Informe_Rendimentos_OTC291_tratada a
/* CHECAGEM SE TOODS OS CONTATOS TIVERAM O OTC TRATADO 
    LEFT OUTER JOIN ( 
      SELECT
        COUNT(1) as CPFS_FALTANDO_NO_OTC
      FROM Informe_rendimentos_publico_inicial ENV
        LEFT JOIN Informe_Rendimentos_OTC291_tratada RET 
            ON ENV.CPF_CNPJ = RET.CPF
      WHERE RET.CPF IS NULL 
    ) b ON 1 = 1*/
    INNER JOIN Informe_rendimentos_publico_inicial c 
        ON c.CPF_CNPJ = a.CPF
WHERE /*b.CPFS_FALTANDO_NO_OTC = 0
 SIGNIFICA QUE TODOS OS CONTATOS JÁ ESTÃO NO OTC291 
  AND*/
  CAST(a.Tipo_Carteira AS INT) != 40