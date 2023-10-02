select top 20000 a.base from PublicoEnvioOTC290CampBaixaRenda_1 a
where not exists(select 1 
                    from PublicoEnvioOTC290CampBaixaRenda b 
                    where substring(a.base,27,11) = substring(b.base,27,11))