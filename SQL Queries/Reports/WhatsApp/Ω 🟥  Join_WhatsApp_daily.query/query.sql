SELECT 
ContactKey,
MobileNumber,
EventDateUTC,
Status,
JBDefinitionID,
SendIdentifier,
TrackingType,
JourneyName,
CPF_CNPJ,
ID_PROPOSTA
FROM Tracking
LEFT JOIN _Journey ON _Journey.VersionID = Tracking.JBDefinitionID
LEFT JOIN AeM_Boas_Vindas_Historico_Propostas ON AeM_Boas_Vindas_Historico_Propostas.Id_Contato = Tracking.ContactKey
WHERE CPF_CNPJ is not null