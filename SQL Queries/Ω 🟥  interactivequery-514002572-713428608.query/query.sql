SELECT
  rtrim(left(coalesce(CAST(CPF as char(255)),'<null>'), 255)) as CPF from TB_BASE_OTC291_TRATADA
WHERE
  CPF like '%00016021000103%'