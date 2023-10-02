SELECT
  QUANTIDADE_FALTANDO
FROM (
  SELECT
    COUNT(1) AS QUANTIDADE_FALTANDO
  FROM TB_CAMPEONATOSKATE_BASE_ENVIO BE
  LEFT JOIN TB_CAMPEONATOSKATE_QUARENTENA_EXECUCAO Q ON Q.ID_CONTATO = BE.ID_CONTATO
  WHERE Q.ID_CONTATO IS NULL
) A
WHERE QUANTIDADE_FALTANDO != 0