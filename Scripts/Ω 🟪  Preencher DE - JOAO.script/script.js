<script runat=server language="JavaScript" executioncontexttype="get">
Platform.Load("Core","1.1");

var TestDE = DataExtension.Init("41fcda40-5d8f-4a1a-9062-3bef62adb5c0");
var result = TestDE.Rows.Add({"Id":"123"}, {"ValorParcela":"100"},{"Valor Parcela":"100"});

Write('<b>Output:</b>'+result);
</script>