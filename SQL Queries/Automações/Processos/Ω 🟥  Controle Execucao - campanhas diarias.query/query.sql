select id as id_campanha, getdate() as data_execucao
from Campaign_SALESFORCE
where HC_Data_de_Execucao__c < getdate() 
      and periodicidade__c = 'Diário'