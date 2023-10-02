select pg.id, pg.HC_Codigo_de_Retorno_de_Erro__c, dpg.Descricao_do_Retorno_de_Erro__c
from PagamentosAtualizarMsgRetornoErro pg
inner join Pagamento_DominioMsgErro dpg
    on pg.HC_Codigo_de_Retorno_de_Erro__c = dpg.HC_Codigo_de_Retorno_de_Erro__c