SELECT
    A.ClienteID,
    A.CPF,
    A.Nome,
    A.DataNascimento,
    A.Cidade,
    A.CEP,
    A.UF,
    A.TipoPessoa,
    A.ChaveTitulo,    
    A.StatusTitulo,
    A.InicioVigencia,
    A.FimVigencia,
    A.ValorParcela,
    A.NumeroProposta,
    A.OrigemVenda,
    A.TipoPagamento,
	A.Celular1,
	A.Celular2,
	A.Celular3,
	A.Fixo1,
	A.Fixo2,
	A.Fixo3,
	A.EMailPessoal,
	A.EMailComercial,
	A.EMailBrasilcap,
	A.EmailPrincipal,
	A.NaoReceberEmail,
	A.DataUltimoResgate,
	A.CodigoOTC
FROM NPSResgateAntecipadoDE A
INNER JOIN
(
    SELECT
        B.CPF,
        MAX(B.NumeroProposta) AS NumeroProposta
    FROM NPSResgateAntecipadoDE B
    GROUP BY
        B.CPF
) C ON C.CPF = A.CPF AND C.NumeroProposta = A.NumeroProposta