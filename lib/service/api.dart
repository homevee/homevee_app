import 'dart:convert';

import 'package:homevee_app/system/serverdata.dart' as serverData;
import 'package:homevee_app/system/serverdata.dart';
import 'package:http/http.dart' as http;

class ResponseData{
  int statusCode;
  String status;
  Map<String, dynamic> data;

  ResponseData(this.statusCode, this.status, this.data);
}

Future<ResponseData> processData(Map<String, dynamic> data) async{
  UserData userData = await serverData.getUserdata();
  return processDataWithUserData(userData, data);
}

Future<ResponseData> processDataWithUserData(UserData userData, Map<String, dynamic> data) async{
  data.putIfAbsent("username", () => userData.username);
  data.putIfAbsent("password", () => userData.password);
  data.putIfAbsent("language", () => "de");

  const String CLOUD_URL = "https://cloud.homevee.de";

  http.Response response = await http.post(CLOUD_URL+"/processdata/"+userData.remoteId.toUpperCase(),
      headers: { 'Content-type': 'application/json',
        'Accept': 'application/json'},
      body: json.encode(data));

  Map<String, dynamic> responseData = json.decode(response.body);

  return new ResponseData(response.statusCode, responseData["type"], responseData["data"]);
}