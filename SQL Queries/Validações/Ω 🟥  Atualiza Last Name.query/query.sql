select  HC_Tipo_de_Relacionamento__c, 
        accountid,
        HC_CPF_CNPJ__c,
        firstName,
        Substring(Name, charindex(' ',name)+1, len(name)) as LastName
from ContatosImportar_Tratado