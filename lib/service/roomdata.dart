import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';

import 'api.dart' as api;

Future<List<RoomItem>> getRoomData(String roomId) async {
  var data = new Map<String, String>();

  data.putIfAbsent("action", () => "getroomdata");
  data.putIfAbsent("room", () => roomId);

  api.ResponseData response = await api.processData(data);

  List<RoomItem> roomList = RoomItem.createListFromJSON(response.data['roomdata'], roomId);

  return roomList;
}