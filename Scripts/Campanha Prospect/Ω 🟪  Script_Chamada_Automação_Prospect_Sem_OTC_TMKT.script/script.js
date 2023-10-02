<script runat="server">

Platform.Load("Core","1.1.1");

var automationCustomerKey = "d469c50c-0d23-42e0-aa0d-f96a8867c529"

var rr = Platform.Function.CreateObject("RetrieveRequest");
Platform.Function.SetObjectProperty(rr, "ObjectType", "Automation");
Platform.Function.AddObjectArrayItem(rr, "Properties", "ProgramID");
Platform.Function.AddObjectArrayItem(rr, "Properties", "CustomerKey");
Platform.Function.AddObjectArrayItem(rr, "Properties", "Status");

var sfp = Platform.Function.CreateObject("SimpleFilterPart");
Platform.Function.SetObjectProperty(sfp, "Property", "CustomerKey");
Platform.Function.SetObjectProperty(sfp, "SimpleOperator", "equals");
Platform.Function.AddObjectArrayItem(sfp, "Value", automationCustomerKey);

Platform.Function.SetObjectProperty(rr, "Filter", sfp);

var retrieveStatus = [0,0,0];

var automationResultSet = Platform.Function.InvokeRetrieve(rr, retrieveStatus);

var ObjectID = automationResultSet[0]["ObjectID"];
var Status = automationResultSet[0]["Status"];

if (ObjectID != "null") {

    if (Status == 2) {

        var obj = Platform.Function.CreateObject("Automation");
        Platform.Function.SetObjectProperty(obj, "ObjectID", ObjectID);
        var po = Platform.Function.CreateObject("PerformOptions");

        var performResult = [0,0,0];
        var performStatus = Platform.Function.InvokePerform(obj, "start", performResult, po);

    } else {
      // already running

    }
} else {
   // automation not found
}

</script>