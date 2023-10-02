SELECT DISTINCT st.CPF AS CPF, 
format(st.Data_Nascimento,'dd/MM/yyyy') AS DT_NASCIMENTO,
IIF(u.SubscriberKey=st.SubscriberKey, 1, 0) AS OPTOUT, 
CASE WHEN j.EmailName = 'Boas Vindas Caracterisitcas Novo' THEN 'Boas Vindas Características Novo'
    WHEN j.EmailName = 'Boas Vindas Caracterisitcas Recorrente' THEN 'Boas Vindas Características Recorrente'
    WHEN j.EmailName = 'Boas Vindas Caracterisitcas Recuperado' THEN 'Boas Vindas Características Recuperado'
    WHEN j.EmailName = 'Fim de Plano PM sem OTC - sem Renovação' THEN 'Fim de Plano PM - sem Renovação'
    WHEN j.EmailName = 'Fim de Plano PM sem OTC - com Renovação' THEN 'Fim de Plano PM - com Renovação'
    WHEN j.EmailName = 'Email Campanha Aniversario - 20212212' THEN 'Campanha Aniversario'
    ELSE j.EmailName END AS CAMPANHA,
REPLACE(j.EmailSubject, ',', '') AS Subject,
MIN(format(st.EventDate, 'dd/MM/yyyy')) AS DT_Envio,
MIN(format(st.EventDate, 'dd/MM/yyyy hh:mm:ss')) AS DT_Entrega, 
IIF(b.JobID=st.JobID, 1, 0) AS Bounce, 
IIF(st.JobID=b.JobID,0,1) AS ENTREGUE, 
IIF(c.JobID=st.JobID, 1,0) AS Clique, 
IIF(o.JobID=st.JobID, 1, 0) AS Abertura, 
IIF((cr.Qtde_Clicks IS NULL), 0, cr.Qtde_Clicks) AS QT_CLIQUE,
MIN(format(o.EventDate, 'dd/MM/yyyy hh:mm:ss')) AS DT_Abertura,
CASE WHEN j.EmailName IN   ('Boas Vindas Caracterisitcas Novo',
                        'Boas Vindas Caracterisitcas Recorrente', 
                        'Boas Vindas Caracterisitcas Recuperado',
                        'Boas Vindas Caracteristicas Novo',
                        'Boas Vindas Caracteristicas Recorrente', 
                        'Boas Vindas Caracteristicas Recuperado',
                        'Email Campanha Aniversario - 20212212',
                        'Email Final de Ano - 20212212',
                        'Campanha_FimdeAno2021',
                        'Periodico de Sorteio',
                        'CAMPANHA_AUTOMATICA_SORTEIO_PERIODICO') THEN	'Relacionamento'
    WHEN j.EmailName IN    ('Boas Vindas Novo',
                        'Boas Vindas Recorrente',
                        'Boas Vindas Recuperado') THEN 'Boas Vindas'
    WHEN j.EmailName IN    ('Fim de Plano PM - com Renovação',
                        'Fim de Plano PM - sem Renovação',
                        'Fim de Plano PM sem OTC - sem Renovação', 
                        'Fim de Plano PM sem OTC - com Renovação') THEN 'Fim de plano/ Renovação'
    ELSE NULL END AS Jornada
FROM ACCOUNT_SENT_INFOS st
LEFT JOIN UNSUBSCRIBE_INFOS u
ON st.SubscriberKey=u.SubscriberKey
JOIN JOB_INFOS j
ON st.JobID=j.JobID
LEFT JOIN BOUNCE_INFOS b
ON st.JobID=b.JobID AND st.SubscriberKey=b.SubscriberKey
LEFT JOIN CLICK_INFOS c
ON st.JobID=c.JobID AND st.SubscriberKey=c.SubscriberKey
LEFT JOIN OPEN_INFOS o
ON st.JobID = o.JobID AND st.SubscriberKey=o.SubscriberKey
LEFT JOIN CLICKS_INFOS_REPORT cr
ON st.SubscriberKey=cr.SubscriberKey AND st.JobID=cr.JobID
GROUP BY st.CPF, st.Data_Nascimento, IIF(u.SubscriberKey=st.SubscriberKey, 1, 0),
j.EmailSubject, j.EmailName, IIF(st.EventDate IS NOT NULL, 1, 0),
IIF(b.JobID=st.JobID, 1, 0), IIF(c.JobID=st.JobID, 1,0), IIF(o.JobID=st.JobID, 1, 0),
cr.Qtde_Clicks, st.JobID, b.JobID
ORDER BY DT_Envio
OFFSET 0 ROWS

