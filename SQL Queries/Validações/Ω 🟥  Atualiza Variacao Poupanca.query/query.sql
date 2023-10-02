select name, left(HC_Numero_da_Conta_Corrente__c, 5) as HC_Variacao_Poupanca__c
from ExtracaoPagamentoMeioCredito
where HC_Meio_de_credito__c = 'Conta Poupança' or HC_Meio_de_credito__c = 'Conta Poupanca'