select  
        HC_Id_Parceiro_Cap__c,
        HC_CPF_CNPJ__c,
        HC_Email_Brasilcap__c, 
        HC_Email_Comercial__c, 
        HC_Email_Pessoal__c, 
        HC_Email_Principal__c 
from HC_Relacao_Cliente_Parceiro__c_SALESFORCE 
where   HC_Id_Parceiro_Cap__c = 'TCBB'
        AND HC_CPF_CNPJ__c  
            in (select cpf_cnpj from CPF_EmailClientes)