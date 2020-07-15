import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';

class HeatingItem extends RoomItem{
  int min, max;
  String einheit;
  double step;

  HeatingItem(String name, int id, String icon, String deviceType, String type,
      this.min, this.max, this.step, this.einheit, String room)
      : super(name, id, icon, deviceType, type, room);
}