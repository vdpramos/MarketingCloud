<script runat="server">

    Platform.Load("core","1.1");

    var DE = "DataExtensionDoJoao"

    try {
        var obj = {
            "CustomerKey" : Platform.Function.GUID(),
            "Name" : DE,
            "Fields" : [
                { "Name" : "Id", "FieldType" : "Number", "IsPrimaryKey" : true, "IsRequired" : true },
                { "Name" : "Valor Parcela", "FieldType" : "Decimal"},
                { "Name" : "Plano", "FieldType" : "Text"},
                { "Name" : "Data Contratacao", "FieldType" : "Date"},
                { "Name" : "Desc Periodicidade Pgto", "FieldType" : "Text"},
                { "Name" : "Valor Nominal", "FieldType" : "Decimal"},
                { "Name" : "Cod Situacao", "FieldType" : "Number"},
                { "Name" : "Desc Situacao", "FieldType" : "Text"},
                { "Name" : "Cod Papel Cliente", "FieldType" : "Number"},
                { "Name" : "Desc Papel Cliente", "FieldType" : "Number"}
            ]
        };
        DataExtension.Add(obj);
        Write("(+) O Data Extension foi criado com sucesso!" + "<br>");
    } catch (err) {
        Write("(!) O Data Extension não foi criado. Erro: " + err + "<br>")
    }     

</script>