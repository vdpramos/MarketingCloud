SELECT rtrim(left(coalesce(CAST(RESULTADO as char(255)),'<null>'), 255)) as RESULTADO, rtrim(left(coalesce(CAST(COUNT(RESULTADO) as char(255)),'<null>'), 255)) as COUNT from Tb_Log_Resultados_de_Avaliacao
WHERE CAMPANHA = 'Renovação Automática - Urgente'
GROUP BY RESULTADO


