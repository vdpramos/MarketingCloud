select rtrim(left(coalesce(CAST(HC_CPF_CNPJ_Subscritor__c as char(255)),'<null>'), 255)) as HC_CPF_CNPJ_Subscritor__c from HC_Titulo__c_Salesforce 
where HC_CPF_CNPJ_Subscritor__c = '27810013840'