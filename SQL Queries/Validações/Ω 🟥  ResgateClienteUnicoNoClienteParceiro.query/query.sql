select c.id, c.cpf_cnpj, c.NomeCompleto, c.parceiro, acc.id as Id_cliente, acc.name as Nome_ClienteUnico
from ClienteParceiroSemClienteUnico c
inner join account_salesforce acc 
    on acc.HC_CPF_CNPJ_Cliente__c = c.cpf_cnpj

    