SELECT
  '001'+
  REPLICATE (' ' , 9)+
  REPLICATE ('0' , 9)+
  '1'+
  RIGHT(REPLICATE ('0' , 15)+CONVERT(VARCHAR, CPF), 15)+
  CONVERT(VARCHAR(10), CAST(DATA_NASCIMENTO AS DATE), 112)+
  LEFT(CONVERT(VARCHAR(60), NOME) + REPLICATE(' ', 60), 60)+
  REPLICATE (' ' , 1)+
  /*REPLICATE (' ' , 2)*/REPLICATE (' ' , 1)+
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
  	Tb_Base_Prospect_ComOTC_Online_Filtrada_AeC