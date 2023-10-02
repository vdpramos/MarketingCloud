SELECT TOP 1000000
    a.Subscriberkey
FROM All_contacts a
WHERE
    Subscriberkey NOT IN (SELECT _ContactKey FROM Contact_Salesforce)
    AND
    Subscriberkey NOT IN (SELECT Id FROM Contact_Salesforce)