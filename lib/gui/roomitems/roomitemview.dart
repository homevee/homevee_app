import 'package:flutter/material.dart';
import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';

import 'switchitemview.dart';

abstract class RoomItemView extends Card{

  RoomItemView({Widget child}): super(child: child);

  static RoomItemView createFromRoomItem(RoomItem roomItem){
    switch(roomItem.type){
      case "switch":
        return SwitchItemView(roomItem);
      default:
        throw new UnimplementedError();
    }
  }
}