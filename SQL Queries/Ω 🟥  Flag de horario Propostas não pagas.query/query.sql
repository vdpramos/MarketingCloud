SELECT HORA 
FROM ( SELECT
CASE
WHEN    (DAY(HC_Data_de_Execucao__c) = DAY(getdate()) AND
        MONTH(HC_Data_de_Execucao__c) = MONTH(getdate()) AND
        YEAR(HC_Data_de_Execucao__c) = YEAR(getdate()) ) THEN 1 END AS HORA
FROM Campaign_Salesforce
WHERE id = '7016g000002O08TAAS') A
WHERE hora = 1