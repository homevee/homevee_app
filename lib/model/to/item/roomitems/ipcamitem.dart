import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';

class IpCamItem extends RoomItem{
  String url, username, password;

  IpCamItem(String name, int id, String icon, String deviceType, String type,
      this.url, this.username, this.password, String room)
      : super(name, id, icon, deviceType, type, room);
}