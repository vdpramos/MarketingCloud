select CPF_CNPJ, CAMPANHA, IDADE, RESULTADO, DATA_REGISTRO
 from Tb_Log_Resultados_de_Avaliacao LOG
 where log.campanha = 'Campanha Online PROSPECT - TMKT' 
 and format(DATA_REGISTRO,'dd/MM/yyyy') = '05/01/2023'