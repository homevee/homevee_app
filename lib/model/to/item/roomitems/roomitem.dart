import 'package:flutter/material.dart';
import 'package:homevee_app/model/to/item/item.dart';
import 'package:homevee_app/model/to/item/roomitems/switchitem.dart';
import 'package:homevee_app/system/icons.dart' as icons;

import 'heatingitem.dart';
import 'ipcamitem.dart';

class RoomItem extends Item{
  String name;
  int id;
  Icon icon;
  String deviceType;
  String type;
  String room;

  RoomItem(this.name, this.id, String icon, this.deviceType, this.type, this.room){
    this.icon = icons.getDeviceIcon(icon);
  }

  static List<RoomItem> createListFromJSON(List<dynamic> objects, String roomId){
    List<RoomItem> roomItems = new List();

    for (var value in objects) {
      roomItems.add(createFromJSON(value as Map, roomId));
    }

    return roomItems;
  }

  static RoomItem createFromJSON(dynamic jsonObject, String roomId){
    Map<String, dynamic> object = jsonObject as Map;

    switch(object["type"]) {
      case "heating":
        int min = 0;
        int max = 40;

        try{
          min = object["min"];
          max = object["max"];
        }
        catch(e){
          e.printStackTrace();
        }

        return new HeatingItem(object["name"], object["id"], object["icon"],
          object["devicetype"], object["type"], min,
          max, object["step"], "°C", roomId);
      case "ipcamera":
        return new IpCamItem(object["name"], object["id"], object["icon"],
          object["devicetype"], object["type"], roomId,
          object["url"], object["username"], object["password"]);
      case "switch":
        return new SwitchItem(object["name"], object["id"], object["icon"], object["devicetype"],
          object["type"], object["value"], roomId);
      default:
        return new RoomItem(object["name"], object["id"], object["icon"], object["devicetype"],
            object["type"], roomId);
    }
  }
}