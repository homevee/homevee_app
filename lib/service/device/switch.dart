import 'package:homevee_app/model/to/item/roomitems/switchitem.dart';

import '../api.dart';

class SwitchDeviceService{
  static Future<SwitchItem> toggle(SwitchItem switchItem) async{
    var data = new Map<String, dynamic>();
    data.putIfAbsent("action", () => "setmodes");
    data.putIfAbsent("type", () => switchItem.deviceType);
    data.putIfAbsent("device", () => switchItem.id);
    data.putIfAbsent("room", () => switchItem.room);
    data.putIfAbsent("zustand", () => switchItem.value ? 1 : 0);
    
    ResponseData response = await processData(data);

    switch(response.status){
      case "ok":
        switchItem.value = !switchItem.value;
    }

    return new Future.value(switchItem);
  }
}