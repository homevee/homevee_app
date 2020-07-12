import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> processData(String username, String password,
    String remoteId, Map<String, String> data) async{

  data.putIfAbsent("username", () => username);
  data.putIfAbsent("password", () => password);
  data.putIfAbsent("language", () => "de");

  const String CLOUD_URL = "https://cloud.homevee.de";

  print("Sending request 'processData'");

  http.Response response = await http.post(CLOUD_URL+"/processdata/"+remoteId.toUpperCase(),
      headers: { 'Content-type': 'application/json',
        'Accept': 'application/json'},
      body: json.encode(data));

  print(response.body);

  return response;
}