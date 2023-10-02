SELECT distinct
  '001'+
  REPLICATE (' ' , 9)+
  REPLICATE ('0' , 9)+
  '1'+
  RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, a.hc_cpf_cnpj_cliente__c), 15)+
  CONVERT(VARCHAR(10), CONVERT(DATE, a.hc_data_nascimento__c, 103), 112)+
  LEFT(CONVERT(VARCHAR(60), a.name) + REPLICATE(' ', 60), 60)+
  REPLICATE (' ' , 1)+
  REPLICATE (' ' , 2)+
  REPLICATE (' ' , 4)+
  REPLICATE (' ' , 10)+
  REPLICATE (' ' , 4)+
  REPLICATE (' ' , 10)+
  REPLICATE (' ' , 4)+
  REPLICATE (' ' , 10)+
  REPLICATE (' ' , 5)+
  REPLICATE (' ' , 2)+
  REPLICATE (' ' , 73)+
  REPLICATE (' ' , 70) AS BASE
FROM
  hc_relacao_cliente_parceiro__c_salesforce r
  inner join account_salesforce a
    on A.HC_CPF_CNPJ_Cliente__c = R.HC_CPF_CNPJ__C
  inner join CPF_EnvioOTC290 env
    on env.cpf = r.HC_CPF_CNPJ__C
where len(env.cpf) = 11 and HC_Chave_Parceiro__c = 52 or HC_chaveParceiro__c = 52 and a.id is not null