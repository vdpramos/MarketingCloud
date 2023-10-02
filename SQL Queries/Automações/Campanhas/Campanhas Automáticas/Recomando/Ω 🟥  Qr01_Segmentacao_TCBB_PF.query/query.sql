select
  q.HC_CPF_CNPJ__c,
  CS.Id as IdContato,
  camp.Id as IdCampaign,
  RCP_ID,
  HC_Titulo__c,
  HC_Id_Parceiro_Cap__c,
  HC_Data_Envio_Registro__c,
  HC_Data_do_pagamento__c,
  HC_Valor_Liquido__c,
  CAMPAIGN_GROUP,
  Telefone_Principal,
  HC_Telefone_Principal__c,
  HC_Celular,
  HC_Celular_1__c,
  HC_Celular_2__c,
  HC_Celular_3__c,
  Email_Principal,
  HC_Email_Principal__c,
  Endereco_Principal,
  HC_Endereco_Principal__c,
  camp.DATA_PROXIMA_EXECUCAO
from [BASE_CAMPANHA_RECOMANDO] Q
inner join (
  SELECT TOP 1
    Id,
    HC_Proxima_execucao__c,
    HC_Ultima_execucao__c,
    HC_Valor_minimo_a_pagar__c,
    HC_Valor_maximo_a_pagar__c,
    HC_Data_inicial_do_periodo_de_queda__c,
    HC_Data_fim_do_periodo_de_queda__c,
    HC_DATA_DE_EXECUCAO__C,
    DATEADD(DAY, HC_PROXIMA_EXECUCAO__C,HC_DATA_DE_EXECUCAO__C) AS DATA_PROXIMA_EXECUCAO
  from [CAMPAIGN_SALESFORCE]
  WHERE HC_Tipo_de_Cliente__c = 'PF'
  and isnull(convert(integer, IsActive), 0) = 1
  AND PARENTID = '7016g000002O08JAAS'
) camp on Q.CAMPAIGN_GROUP = 'PF Ourocap'
INNER JOIN [Contact_Salesforce] CS ON CS.HC_CPF_CNPJ_Tipo_de_Relacionamento__c = concat(q.HC_CPF_CNPJ__c, 'Cliente')
WHERE
    q.HC_Valor_Liquido__c is not null
    and q.HC_Valor_Liquido__c >= isnull(camp.HC_Valor_minimo_a_pagar__c, 0)
    and (
      camp.HC_Valor_maximo_a_pagar__c is null
      or isnull(q.HC_Valor_Liquido__c, 0) <= camp.HC_Valor_maximo_a_pagar__c
    )
    AND HC_Data_Envio_Registro__c between HC_Data_inicial_do_periodo_de_queda__c  and HC_Data_fim_do_periodo_de_queda__c 
     AND CONVERT(VARCHAR, camp.HC_DATA_DE_EXECUCAO__C, 112) = CONVERT(VARCHAR, GETDATE(), 112) 