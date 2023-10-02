select
    q.HC_CPF_CNPJ__c,
    CAMPAIGN_GROUP,
    case
      when CAMPAIGN_GROUP = 'CAP Fiador' then max(camp1.Id)
      when CAMPAIGN_GROUP = 'pf ourocap' then max(camp2.Id)
      when CAMPAIGN_GROUP = 'pj ourocap' then max(camp3.Id)
    end as Id,
    case
      when CAMPAIGN_GROUP = 'CAP Fiador' then max(camp1.HC_Proxima_execucao__c)
      when CAMPAIGN_GROUP = 'pf ourocap' then max(camp2.HC_Proxima_execucao__c)
      when CAMPAIGN_GROUP = 'pj ourocap' then max(camp3.HC_Proxima_execucao__c)
    end as HC_Proxima_execucao__c,
    case
      when CAMPAIGN_GROUP = 'CAP Fiador' then max(camp1.HC_Ultima_execucao__c)
      when CAMPAIGN_GROUP = 'pf ourocap' then max(camp2.HC_Ultima_execucao__c)
      when CAMPAIGN_GROUP = 'pj ourocap' then max(camp3.HC_Ultima_execucao__c)
    end as HC_Ultima_execucao__c,
    case
      when CAMPAIGN_GROUP = 'CAP Fiador' then max(camp1.HC_Valor_minimo_a_pagar__c)
      when CAMPAIGN_GROUP = 'pf ourocap' then max(camp2.HC_Valor_minimo_a_pagar__c)
      when CAMPAIGN_GROUP = 'pj ourocap' then max(camp3.HC_Valor_minimo_a_pagar__c)
    end as HC_Valor_minimo_a_pagar__c,
    case
      when CAMPAIGN_GROUP = 'CAP Fiador' then max(camp1.HC_Valor_maximo_a_pagar__c)
      when CAMPAIGN_GROUP = 'pf ourocap' then max(camp2.HC_Valor_maximo_a_pagar__c)
      when CAMPAIGN_GROUP = 'pj ourocap' then max(camp3.HC_Valor_maximo_a_pagar__c)
    end as HC_Valor_maximo_a_pagar__c,
    case
      when CAMPAIGN_GROUP = 'CAP Fiador' then max(camp1.HC_Data_inicial_do_periodo_de_queda__c)
      when CAMPAIGN_GROUP = 'pf ourocap' then max(camp2.HC_Data_inicial_do_periodo_de_queda__c)
      when CAMPAIGN_GROUP = 'pj ourocap' then max(camp3.HC_Data_inicial_do_periodo_de_queda__c)
    end as HC_Data_inicial_do_periodo_de_queda__c,
    case
      when CAMPAIGN_GROUP = 'CAP Fiador' then max(camp1.HC_Data_fim_do_periodo_de_queda__c)
      when CAMPAIGN_GROUP = 'pf ourocap' then max(camp2.HC_Data_fim_do_periodo_de_queda__c)
      when CAMPAIGN_GROUP = 'pj ourocap' then max(camp3.HC_Data_fim_do_periodo_de_queda__c)
    end as HC_Data_fim_do_periodo_de_queda__c
  from [BASE_CAMPANHA_RECOMANDO] Q
  left join (
    SELECT TOP 1
      Id,
      HC_Proxima_execucao__c,
      HC_Ultima_execucao__c,
      HC_Valor_minimo_a_pagar__c,
      HC_Valor_maximo_a_pagar__c,
      HC_Data_inicial_do_periodo_de_queda__c,
      HC_Data_fim_do_periodo_de_queda__c
    from [CAMPAIGN_SALESFORCE]
    WHERE HC_Tipo_de_Cliente__c = 'PF e PJ'
    and isnull(convert(integer, IsActive), 0) = 1
    AND PARENTID = '7016g000002NyxZAAS'
  ) camp1 on Q.CAMPAIGN_GROUP = 'CAP Fiador'
  left join (
    SELECT TOP 1
      Id,
      HC_Proxima_execucao__c,
      HC_Ultima_execucao__c,
      HC_Valor_minimo_a_pagar__c,
      HC_Valor_maximo_a_pagar__c,
      HC_Data_inicial_do_periodo_de_queda__c,
      HC_Data_fim_do_periodo_de_queda__c
    from [CAMPAIGN_SALESFORCE]
    WHERE HC_Tipo_de_Cliente__c = 'PF'
    and isnull(convert(integer, IsActive), 0) = 1
    AND PARENTID = '7016g000002NyxZAAS'
  ) camp2 on Q.CAMPAIGN_GROUP = 'pf ourocap'
  left join (
    SELECT TOP 1
      Id,
      HC_Proxima_execucao__c,
      HC_Ultima_execucao__c,
      HC_Valor_minimo_a_pagar__c,
      HC_Valor_maximo_a_pagar__c,
      HC_Data_inicial_do_periodo_de_queda__c,
      HC_Data_fim_do_periodo_de_queda__c
    from [CAMPAIGN_SALESFORCE]
    WHERE HC_Tipo_de_Cliente__c = 'PJ'
    and isnull(convert(integer, IsActive), 0) = 1
    AND PARENTID = '7016g000002NyxZAAS'
  ) camp3 on Q.CAMPAIGN_GROUP = 'pj ourocap'
  where 
  camp1.Id is not null
  or camp2.Id is not null
  or camp3.Id is not null
  group by q.HC_CPF_CNPJ__c, Q.CAMPAIGN_GROUP