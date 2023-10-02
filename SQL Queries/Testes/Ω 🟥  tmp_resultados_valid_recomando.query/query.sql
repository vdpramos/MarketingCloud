select
  q.HC_CPF_CNPJ__c,
  q.result,
  q.campaign_group,
  q.HC_Valor_Liquido__c,
  HC_Valor_minimo_a_pagar__c,
  HC_Valor_maximo_a_pagar__c,
  case
    when q.[HC_Data_do_pagamento__c] is null then ''
    else concat(
      CONVERT(varchar(10), q.[HC_Data_do_pagamento__c], 103),
      ' ',
      CONVERT(varchar(8), q.[HC_Data_do_pagamento__c], 114)
    )
  end as [HC_Data_do_pagamento__c],
  case
    when [HC_Data_inicial_do_periodo_de_queda__c] is null then ''
    else concat(
      CONVERT(varchar(10), [HC_Data_inicial_do_periodo_de_queda__c], 103),
      ' ',
      CONVERT(varchar(8), [HC_Data_inicial_do_periodo_de_queda__c], 114)
    )
  end as [HC_Data_inicial_do_periodo_de_queda__c],
  case
    when [HC_Data_fim_do_periodo_de_queda__c] is null then ''
    else concat(
      CONVERT(varchar(10), [HC_Data_fim_do_periodo_de_queda__c], 103),
      ' ',
      CONVERT(varchar(8), [HC_Data_fim_do_periodo_de_queda__c], 114)
    )
  end as [HC_Data_fim_do_periodo_de_queda__c],
  case 
    when (
      camp.HC_Valor_maximo_a_pagar__c is null
      or isnull(q.HC_Valor_Liquido__c, 0) <= camp.HC_Valor_maximo_a_pagar__c
    ) then 1
    else 0
  end as Less_Than_Max,
  case 
    when isnull(q.HC_Valor_Liquido__c, 0) >= isnull(camp.HC_Valor_minimo_a_pagar__c, 0) then 1
    else 0
  end as Greather_Than_Min,
  case 
    when 
      HC_Data_do_pagamento__c is not null
      and 
      (
        camp.HC_Data_inicial_do_periodo_de_queda__c is null
        or HC_Data_do_pagamento__c >= camp.HC_Data_inicial_do_periodo_de_queda__c
      )
    then 1
    else 0
  end as dt_posterior_ao_min,
  case 
    when 
      HC_Data_do_pagamento__c is not null
      and
      (
        camp.HC_Data_fim_do_periodo_de_queda__c is null
        or HC_Data_do_pagamento__c <= camp.HC_Data_fim_do_periodo_de_queda__c
      )
    then 1
    else 0
  end as dt_anterior_ao_max
from [Base] q
left join [base_campanhas] camp on camp.HC_CPF_CNPJ__c = q.HC_CPF_CNPJ__c and Q.campaign_group = CAMP.CAMPAIGN_GROUP