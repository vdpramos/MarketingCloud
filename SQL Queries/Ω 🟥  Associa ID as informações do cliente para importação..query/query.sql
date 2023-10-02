select  N.ID, 
        I.cpf as HC_CPF_CNPJ_Cliente__c, 
        i.NOME_COMPLETO as NAME,
        i.TP_CLIENTE as HC_Tipo_de_Pessoa__c,
        i.SEXO as HC_Sexo__c,
        i.PPE as HC_PEP__c, 
        i.DATA_NASCIMENTO as HC_Data_Nascimento__c
from Retorno_InfoClienteUnico I
inner join ClienteUnicoNomeNaoInformado N 
    on N.CPF_CNPJ = I.CPF