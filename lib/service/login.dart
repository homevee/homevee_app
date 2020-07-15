import 'dart:convert';

import 'package:homevee_app/model/to/room.dart';
import 'package:http/http.dart' as http;
import 'api.dart' as api;
import 'package:homevee_app/system/serverdata.dart' as serverData;

Future<List<Room>> login(String username, String password,
    String remoteId) async {

  var data = new Map<String, String>();

  data.putIfAbsent("action", () => "login");

  serverData.UserData userData = new serverData.UserData(username, password, remoteId);

  api.ResponseData response = await api.processDataWithUserData(userData, data);

  switch(response.statusCode){
    case 200:
      serverData.updateUserData(username, password, remoteId);

      List<Room> roomList = new List();
      response.data["rooms"].forEach((element) {roomList.add(Room.fromJson(element));});

      return new Future.value(roomList);
    default:
      return new Future.value(null);
  }
}