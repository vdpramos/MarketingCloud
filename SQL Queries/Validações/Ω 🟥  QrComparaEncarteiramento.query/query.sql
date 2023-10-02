select e.cpf, e.parceiro, d.desc_encarteiramento as encarteiramento, c.id, c.encarteiramento__c, d.id_encarteiramento
from encarteiramento e
inner join hc_relacao_cliente_parceiro__c_SALESFORCE c
    on e.cpf = c.HC_CPF_CNPJ__c
    and e.parceiro = HC_Id_Parceiro_Cap__c
inner join dom_encarteiramento d
    on d.id_encarteiramento = e.encarteiramento
where d.desc_encarteiramento <> c.encarteiramento__c