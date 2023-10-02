SELECT
  '001'+
  REPLICATE (' ' , 9)+
  REPLICATE ('0' , 9)+
  '1'+
  RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, HC_CPF_CNPJ_Cliente__c), 15)+
  LEFT(CONVERT(VARCHAR, HC_Data_Nascimento__c) + REPLICATE(' ', 8), 8)+
  LEFT(CONVERT(VARCHAR, Name) + REPLICATE(' ', 60), 60)+
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
  ACCOUNT_SALESFORCE