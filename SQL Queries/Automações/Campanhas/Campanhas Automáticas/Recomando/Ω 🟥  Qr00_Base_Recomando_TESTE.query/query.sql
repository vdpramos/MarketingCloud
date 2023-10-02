select
  RCP.HC_CPF_CNPJ__c,
  RCP.HC_Id_Parceiro_Cap__c,
  RCP.ID AS RCP_ID,
  PAG.HC_Titulo__c,
  PAG.HC_Valor_Liquido__c,
  PAG.HC_Data_do_pagamento__c,
  case
    WHEN RCP.HC_Id_Parceiro_Cap__c = 'TCBB' AND RCP.HC_Tipo_de_Pessoa__c = 'PF' then 'PF Ourocap'
    WHEN RCP.HC_Id_Parceiro_Cap__c = 'TCBB' AND RCP.HC_Tipo_de_Pessoa__c = 'PJ' then 'PJ Ourocap'
    ELSE 'CAP Fiador'
  end as CAMPAIGN_GROUP,
  case
    when RCP.HC_Telefone_Principal__c = 'Telefone Comercial' then HC_Telefone_Comercial__c
    when RCP.HC_Telefone_Principal__c = 'Telefone Outro' then HC_Telefone_Outro__c
    when RCP.HC_Telefone_Principal__c = 'Telefone Residencial' then HC_Telefone_Residencial__c
  end as Telefone_Principal,
  HC_Telefone_Principal__c,
  /* Telefone celular ativo */
  case
    when RCP.HC_Celular_1__c is not null then
      REPLACE(
        REPLACE(
          REPLACE(
            REPLACE(
            RCP.HC_Celular_1__c
            , ' ', '')
          , '-', '')
        , ')', '')
      , '(', '')
    when RCP.HC_Celular_2__c is not null then
      REPLACE(
          REPLACE(
            REPLACE(
              REPLACE(
              RCP.HC_Celular_2__c
              , ' ', '')
            , '-', '')
          , ')', '')
        , '(', '')
    when RCP.HC_Celular_3__c is not null then
      REPLACE(
          REPLACE(
            REPLACE(
              REPLACE(
              RCP.HC_Celular_3__c
              , ' ', '')
            , '-', '')
          , ')', '')
        , '(', '')
  end as HC_Celular,
  HC_Celular_1__c,
  HC_Celular_2__c,
  HC_Celular_3__c,
  /* E-mail preenchido */
  case
    when RCP.HC_Email_Principal__c = 'Brasilcap' then HC_Email_Brasilcap__c
    when RCP.HC_Email_Principal__c = 'Comercial' then HC_Email_Comercial__c
    when RCP.HC_Email_Principal__c = 'Pessoal' then HC_Email_Pessoal__c
  end as Email_Principal,
  HC_Email_Principal__c,
  /* Endereço */
  case
    when RCP.HC_Endereco_Principal__c = 'Comercial' then HC_Endereco_Comercial__c
    when RCP.HC_Endereco_Principal__c = 'Correspondencia' then HC_Endereco_Correspondencia__c
    when RCP.HC_Endereco_Principal__c = 'Outro' then HC_Endereco_Outro__c
    when RCP.HC_Endereco_Principal__c = 'Principal' then HC_Endereco_Principal__c
    when RCP.HC_Endereco_Principal__c = 'Residencial' then HC_Endereco_Residencial__c
  end as Endereco_Principal,
  HC_Endereco_Principal__c
from [HC_Relacao_Cliente_Parceiro__c_Salesforce_Test_Recomando] RCP
INNER JOIN [HC_Titulo__c_Salesforce_Test_Recomando] TIT ON TIT.HC_Cliente_x_Parceiro__c = RCP.ID
INNER JOIN [HC_Pagamento__c_Salesforce_Test_Recomando] PAG ON TIT.ID = PAG.HC_Titulo__c
WHERE RCP.HC_ORIGEM__C = 'CAP'