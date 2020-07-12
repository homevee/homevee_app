import 'package:http/http.dart' as http;
import 'api.dart' as api;
import '../system/serverdata.dart' as serverData;

Future<http.Response> login(String username, String password,
    String remoteId) async {

  var data = new Map<String, String>();

  data.putIfAbsent("action", () => "login");

  http.Response response = await api.processData(username, password, remoteId, data);

  switch(response.statusCode){
    case 200:
      serverData.updateUserData(username, password, remoteId);
      break;
  }

  return response;
}