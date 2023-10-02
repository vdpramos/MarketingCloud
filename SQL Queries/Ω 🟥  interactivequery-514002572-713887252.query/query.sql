SELECT 
  rtrim(left(coalesce(CAST(ContactKey as char(255)),'<null>'), 255)) as ContactKey, rtrim(left(coalesce(CAST(CPF_CNPJ as char(255)),'<null>'), 255)) as CPF_CNPJ, rtrim(left(coalesce(CAST(ID_PROPOSTA as char(255)),'<null>'), 255)) as ID_PROPOSTA, rtrim(left(coalesce(CAST(MobileNumber as char(255)),'<null>'), 255)) as MobileNumber, rtrim(left(coalesce(CAST(JourneyName as char(255)),'<null>'), 255)) as JourneyName, rtrim(left(coalesce(CAST(MAX(CASE WHEN Status = 'SENT' THEN 1 ELSE 0 END) as char(255)),'<null>'), 255)) as enviado, rtrim(left(coalesce(CAST(MAX(CASE WHEN Status = 'SENT' THEN [EventDateUTC] ELSE NULL END) as char(255)),'<null>'), 255)) as data_do_envio, rtrim(left(coalesce(CAST(MAX(CASE WHEN Status = 'DELIVERED' THEN 1 ELSE 0 END) as char(255)),'<null>'), 255)) as entregue, rtrim(left(coalesce(CAST(MAX(CASE WHEN Status = 'DELIVERED' THEN [EventDateUTC] ELSE NULL END) as char(255)),'<null>'), 255)) as data_da_entrega, rtrim(left(coalesce(CAST(MAX(CASE WHEN Status = 'READ' THEN 1 ELSE 0 END) as char(255)),'<null>'), 255)) as lido, rtrim(left(coalesce(CAST(MAX(CASE WHEN Status = 'READ' THEN [EventDateUTC] ELSE NULL END) as char(255)),'<null>'), 255)) as data_da_leitura from Tracking_Union
GROUP BY ContactKey, CPF_CNPJ, ID_PROPOSTA, JourneyName, MobileNumber