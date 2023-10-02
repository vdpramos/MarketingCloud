/* Não importune 1 */
SELECT
  HC_CPF_CNPJ__C,
  ID_PRODUTO,
  ID_TITULO,
  case
    when N.TELEFONE IS NOT NULL then 1
    ELSE NAO_IMPORTUNE
  end as NAO_IMPORTUNE
FROM [Base_Revenda_Homolog_v2]
LEFT JOIN TB_BASE_NAO_IMPORTUNE N on LTRIM(RTRIM(N.TELEFONE)) = TEL_01
where TEL_01 is not null
  and N.TELEFONE is not null