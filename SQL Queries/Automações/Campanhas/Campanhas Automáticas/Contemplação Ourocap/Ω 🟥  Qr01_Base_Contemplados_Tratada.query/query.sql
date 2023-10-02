SELECT BASE.CPF_CNPJ,
       BASE.NOME,
       BASE.IDADE,
       BASE.DT_NASCIMENTO,
       BASE.SEXO,
       BASE.TIPO_PESSOA,
       BASE.PARCEIRO,
       BASE.Id_Campanha,
       BASE.Id,
       BASE.Id_Cliente_Parceiro,
       BASE.Id_Contato,
       BASE.Id_Cliente,
       BASE.DT_INICIO_SORTEIO,
       BASE.Valor_Max_Contemplacao,
       BASE.Valor_Min_Contemplacao,
       BASE.Dt_Inicio_Contemplacao,
       BASE.Dt_Fim_Contemplacao,
	   BASE.Dt_Ultima_Contemplacao,
	   BASE.Valor_Premio,
	   BASE.Numero_Sorteado,
       CASE WHEN BASE.DDD_TEL_06 IS NOT NULL
                AND BASE.TEL_06 IS NOT NULL THEN CONCAT('55',BASE.DDD_TEL_06, BASE.TEL_06)
           WHEN BASE.DDD_TEL_04 IS NOT NULL
                AND BASE.TEL_04 IS NOT NULL THEN CONCAT('55',BASE.DDD_TEL_04, BASE.TEL_04)
           WHEN BASE.DDD_TEL_05 IS NOT NULL
                AND BASE.TEL_05 IS NOT NULL THEN CONCAT('55',BASE.DDD_TEL_05, BASE.TEL_05)
       END AS NUMERO_CELULAR_ATIVO,
       BASE.DATA_PROXIMA_EXECUCAO,
       'BR' AS LOCALE
FROM Tb_Base_Contemplacao_Ourocap BASE
WHERE 
    (
  LEN(CONCAT(BASE.DDD_TEL_04, BASE.TEL_04)) = 11
  OR LEN(CONCAT(BASE.DDD_TEL_05, BASE.TEL_05)) = 11
  OR LEN(CONCAT(BASE.DDD_TEL_06, BASE.TEL_06)) = 11
  )