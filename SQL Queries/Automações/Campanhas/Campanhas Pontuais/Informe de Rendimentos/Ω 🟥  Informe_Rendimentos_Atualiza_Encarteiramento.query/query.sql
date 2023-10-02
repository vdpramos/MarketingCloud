SELECT
  a.CPF,
  b.DESC_ENCARTEIRAMENTO AS Encarteiramento
FROM Informe_Rendimentos_OTC291_tratada a
  LEFT JOIN Dom_Encarteiramento b
    ON CAST(a.Tipo_Carteira AS INT) = CAST(b.ID_ENCARTEIRAMENTO AS INT)