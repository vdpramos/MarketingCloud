SELECT 
  ContactKey,
  CPF_CNPJ,
  ID_PROPOSTA,
  MobileNumber,
  JourneyName, 
  MAX(CASE WHEN Status = 'SENT' THEN 1 ELSE 0 END) AS enviado, 
  MAX(CASE WHEN Status = 'SENT' THEN [EventDateUTC] ELSE NULL END) AS data_do_envio,
  MAX(CASE WHEN Status = 'DELIVERED' THEN 1 ELSE 0 END) AS entregue, 
  MAX(CASE WHEN Status = 'DELIVERED' THEN [EventDateUTC] ELSE NULL END) AS data_da_entrega,
  MAX(CASE WHEN Status = 'READ' THEN 1 ELSE 0 END) AS lido, 
  MAX(CASE WHEN Status = 'READ' THEN [EventDateUTC] ELSE NULL END) AS data_da_leitura
FROM Tracking_Union
GROUP BY ContactKey, CPF_CNPJ, ID_PROPOSTA, JourneyName, MobileNumber