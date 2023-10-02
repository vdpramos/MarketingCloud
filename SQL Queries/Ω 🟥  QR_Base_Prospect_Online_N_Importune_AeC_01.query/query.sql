SELECT B.CPF,
      CASE WHEN B.VALIDA_NAO_IMPORTUNE = 1 AND (N1.TELEFONE IS NOT NULL) THEN 1 ELSE 0 END AS Nao_Importune
FROM 	Tb_Base_Prospect_ComOTC_Online_Tratada_AeC B 
INNER JOIN TB_BASE_NAO_IMPORTUNE N1 ON ISNULL(CONCAT(DDD_01, TEL_01), '00000000000') = LTRIM(RTRIM(N1.TELEFONE))
