SELECT DISTINCT
    'TCBB' AS COD_PARCEIRO,
    A.HC_CODIGO__C AS COD_PRODUTO,
    A.NAME AS NOME_PRODUTO,
    A.HC_DESCRICAO__C AS DESCRICAO,
    A.HC_SERIE__C AS NUM_TITULOS_SERIE,
    CONVERT(VARCHAR, A.HC_INICIO_AGENDAMENTO__C, 112) AS DT_INICIO_VENDA,
    CONVERT(VARCHAR, A.HC_FIM_AGENDAMENTO__C, 112) AS DT_FIM_VENDA,
    A.HC_DIA_DEBITO__C AS DIA_DEBITO,
    A.HC_TEIMOSINHA__C AS QTD_TEIMOSINHA,
    A.HC_PENALIDADE_ATRASO__C AS PENALIDADE_ATRASO,
    A.HC_VIGENCIA__C AS NUM_MESES_VIGENCIA,
    A.HC_TIPO_DE_PAGAMENTO__C AS TIPO_PAGAMENTO,
    A.HC_NUMERO_DE_PAGAMENTOS__C AS NUM_PARCELAS,
    A.HC_PERIODICIDADE_DE_REAJUSTE__C AS PERIODICIDADE_REAJUSTE,
    A.HC_ATUALIZACAO_SALDO__C AS PERC_ATUALIZACAO_SALDO,
    A.HC_BONUS__C AS PERC_BONUS,
    A.HC_PERIODICIDADE_DE_EXTRATO__C AS PERIODICIDADE_EXTRATO,
    A.HC_PRAZO_MAXPROR_VIGENCIA__C AS PRAZO_MAX_PRORROGACAO_VIGENCIA,
    A.HC_CADUCIDADE__C AS NUM_MESES_CADUCIDADE,
    A.HC_RESGATE_ANTECIPADO_PARCIAL__C AS INDICADOR_RESGATE_PARCIAL,
    A.HC_VALOR_MINIMO__C AS VALOR_MIN_RESGATE,
    A.HC_PERCENTUAL_MAXIMO__C AS PERC_MAX_RESGATE,
    A.HC_QTD_MINIMA_DE_PARCELAS_PAGAS__C AS QTD_MIN_PARCELAS_PAGAS_RESGATE_ANTECIPADO,
    A.HC_MES_PERMITIDO__C AS MES_RESGATE_PARCIAL_PERMITIDO,
    A.HC_PRAZO__C AS PRAZO_RESGATE_FINAL,
    A.HC_INTERVALO_ENTRE_RESGATE_PARCIAL__C AS INTERVALO_RESGATE_PARCIAL,
    A.HC_PRAZO_DE_CARENCIA__C AS PRAZO_CARENCIA_RESGATE_ANTECIPADO,
    A.HC_BASE_PARA_SORTEIO__C AS BASE_SORTEIO,
    A.HC_SORTEIOS__C AS SORTEIOS,
    A.HC_CHANCES_DE_CONTEMPLACAO__C AS CHANCE_CONTEMPLACAO,
    A.HC_TIPOS_DE_SORTEIO__C AS TIPO_SORTEIO,
    A.HC_RENOVACAO_AUTOMATICA__C AS INFO_RENOVACAO_AUTOMATICA,
    '99999999999' AS INICIO_TRAILLER
FROM HC_PRODUTO__C_SALESFORCE A
INNER JOIN TB_BASE_PROSPECT_COMOTC_TRATADA_NEOBPO B ON A.ID = B.NOME_PRODUTO