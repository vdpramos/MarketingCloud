SELECT MCI
FROM BaseMCI RC
WHERE not exists(
                    Select 1 
                    from HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE m 
                    where RC.MCI = M.HC_MCI_BB_Cliente__c)