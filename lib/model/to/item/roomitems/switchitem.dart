import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';

class SwitchItem extends RoomItem{
  bool value;

  SwitchItem(String name, int id, String icon, String deviceType, String type,
      this.value, String room) : super(name, id, icon, deviceType, type, room);
}