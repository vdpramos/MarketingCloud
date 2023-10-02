<script runat="server">
  Platform.Load("Core", "1");
  //CONFIG
  var baseURL = 'https://mcn724g5q4ftdks0ym7-hmp2s691';
  var client_id = 'ie69ep03ytzxu0mpai4bt869';
  var client_secret = 'QNnWNjQJk9MQdrjxg0yWOltj';
  var DE = 'B301ECBB-91C7-4390-91BA-69CC479CCEFA'; //DE NAME: Exclusao_contatos
  var LogDE = DataExtension.Init("6EF0D027-ABDD-460C-8D31-51A13D6D7398"); //DE NAME: Exclusao_contatos_Log
  //AUTHENTICATE
  try {
      var url = baseURL+'.auth.marketingcloudapis.com/v2/token';
      var contentType = 'application/json';
      var payload = '{"grant_type": "client_credentials","client_id": "'+client_id+'","client_secret": "'+client_secret+'"}';
      var accessTokenRequest = HTTP.Post(url, contentType, payload);
      var accessToken = Platform.Function.ParseJSON(accessTokenRequest["Response"][0]).access_token;
      if(accessToken !='')
        //EXECUTE
      {
        try { 
          var deleteUrl = baseURL+'.rest.marketingcloudapis.com/contacts/v1/contacts/actions/delete?type=listReference';
          var payload1 = '{"deleteOperationType": "ContactAndAttributes","targetList": {"listType": {"listTypeID": 3},"listKey": "'+DE+'"},"deleteListWhenCompleted": false,"deleteListContentsWhenCompleted": false}';
          var headerNames = ["Authorization"];
          var s1="Bearer ";
          var headerValues = [s1.concat(accessToken)];
          var request = HTTP.Post(deleteUrl, contentType, payload1, headerNames, headerValues);
          var requestResponse = Platform.Function.ParseJSON(request["Response"][0]);
          LogDE.Rows.Add({Resultado:"Success",RowCount:requestResponse.targetListInformation.rowCount,OperationID:requestResponse.operationID});
        }
        catch (err) {
          LogDE.Rows.Add({Resultado:"Error: " + Stringify(err)});
        }
      }
    }
  catch (e) {
    LogDE.Rows.Add({Resultado:"Error: " + Stringify(e)});
  }
</script>