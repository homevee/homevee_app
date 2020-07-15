import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';
import 'package:homevee_app/model/to/item/roomitems/switchitem.dart';
import 'package:homevee_app/service/device/switch.dart';

class DeviceService{
  static Future<RoomItem> triggerDeviceAction(RoomItem roomItem){
    switch(roomItem.type){
      case "switch":
        return SwitchDeviceService.toggle(roomItem as SwitchItem);
      /*
      case "heating":
        return HeatingDeviceService.toggle(roomItem as HeatingItem);
      case "ipcam":
        return IpCamDeviceService.toggle(roomItem as IpCamItem);
      */
    }
  }
}