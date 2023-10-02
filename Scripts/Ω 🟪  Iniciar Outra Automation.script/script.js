<script runat="server">

Platform.Load("Core","1.1.1");

var automationCustomerKey = "22b65ece-7c33-cde3-01ae-c2f79d41d667"

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

    /*
    Code Status
    -1   Error
     0   BuildingError
     1   Building
     2   Ready
     3   Running
     4   Paused
     5   Stopped
     6   Scheduled
     7   Awaiting Trigger
     8   InactiveTrigger
    */

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