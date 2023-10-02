SELECT
  A.CPF_CNPJ,
  A.Id,
  '55' + REPLACE(REPLACE(REPLACE(REPLACE(A.HC_Celular_1__c, '(', ''), ')', ''), ' ', ''), '-', '') AS HC_Celular_1__c
FROM AeM_propostas_n_pagas_vfinal A
WHERE HC_Celular_1__c IS NOT NULL