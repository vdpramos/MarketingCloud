SELECT DISTINCT HC_CPF_CNPJ__c as cpf_cnpj 
FROM HC_RELACAO_CLIENTE_PARCEIRO__C_SALESFORCE
    WHERE 
                ((HC_CLASSIFICACAO__C ='Cliente' 
                        AND (HC_chaveParceiro__c = '52' or HC_Chave_Parceiro__c = '52'))
                   
                    OR (
                        HC_CLASSIFICACAO__C IN ('Ex-cliente', 'Cliente Potencial')
                        AND (HC_IDADE__C >= 18 AND HC_IDADE__C <= 70)
                        AND HC_chaveParceiro__c = '52' or HC_Chave_Parceiro__c = '52'))
                    
                       
                    AND ((HC_EMAIL_BRASILCAP__C is not null 
                                OR HC_EMAIL_COMERCIAL__C is not null 
                                OR HC_EMAIL_PESSOAL__C is not null )
                    		OR (
                    			(HC_STATUS_CELULAR_1__C = 'Válido' AND HC_CELULAR_1__C is not null)
                        			OR (HC_STATUS_CELULAR_2__C = 'Válido' AND HC_CELULAR_2__C is not null)
                        			OR (HC_STATUS_CELULAR_3__C = 'Válido' AND HC_CELULAR_3__C is not null)
                        			OR (HC_STATUS_CELULAR_3_3__C = 'Válido' AND HC_CELULAR_3_3__C is not null)
                        			OR (HC_STATUS_CELULAR_4__C = 'Válido' AND HC_CELULAR_4__C is not null))
                    		OR (
                    			(HC_STATUS_TEL_COMERCIAL__C = 'Válido' AND HC_TELEFONE_COMERCIAL__C is not null)
                        			OR (HC_STATUS_TEL_OUTRO__C = 'Válido' AND HC_TELEFONE_OUTRO__C is not null)
                        			OR (HC_STATUS_TEL_RESIDENCIAL__C = 'Válido' AND HC_TELEFONE_RESIDENCIAL__C is not null)
                    		)
                    	)
                    
                    
                   