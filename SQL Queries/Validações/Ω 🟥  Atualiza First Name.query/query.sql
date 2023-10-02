select  HC_Tipo_de_Relacionamento__c, 
        accountid,
        HC_CPF_CNPJ_Cliente__c as HC_CPF_CNPJ__c,
        substring(name, 1, 10) as firstName, 
        /*substring(name, 1, charindex(' ', name)-1) as firstName*/
        name
from ClienteUnicoSemContato_Tratado