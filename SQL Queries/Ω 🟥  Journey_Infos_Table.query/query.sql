SELECT DISTINCT ja.VersionID AS VersionID, j.JourneyName AS CAMPANHA_JORNADA, st.JobID AS JobID,
j.CreatedDate AS CreatedDate, j.LastPublishedDate AS LastPublishedDate, j.JourneyStatus AS JourneyStatus 
FROM _JourneyActivity ja
JOIN _Journey j
ON ja.VersionID=j.VersionID 
JOIN ACCOUNT_SENT_INFOS st
ON ja.JourneyActivityObjectID=st.TriggererSendDefinitionObjectID