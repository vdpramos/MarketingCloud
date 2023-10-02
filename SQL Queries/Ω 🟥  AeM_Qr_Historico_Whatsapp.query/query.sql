SELECT
        Id_Cliente_Parceiro,
        TITULOS_ANTERIORES_INATIVOS,
        Id_Contato,
        EMAIL,
        NAO_DESEJA_RECEBER_SMS
        CPF_CNPJ,
        EMAIL_VALIDO,
        Flag_WhatsApp,
        Nome,
        NAO_DESEJA_RECEBER_EMAIL,
        CELULAR,
        locale,
        Id_Campanha,
        CreatedDate,
        CELULAR_VALIDO
FROM AeM_Boas_Vindas_Disparo WHERE Flag_WhatsApp = 'False'