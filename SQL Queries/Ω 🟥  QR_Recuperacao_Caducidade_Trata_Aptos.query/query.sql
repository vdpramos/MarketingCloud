SELECT
  A.*
FROM Tb_Recuperacao_Caducidade_Publico_Inicial A
WHERE COMPRA_UTIMOS_30_DIAS = 'False' 
      AND POSSUI_TITULO_ATIVO = 'False'
      AND QUARENTENA = 'False'
      AND NAO_IMPORTUNE = 'False'




