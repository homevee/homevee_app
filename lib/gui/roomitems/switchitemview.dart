import 'package:flutter/material.dart';
import 'package:homevee_app/gui/roomitems/roomitemview.dart';
import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';
import 'package:homevee_app/model/to/item/roomitems/switchitem.dart';

class SwitchItemView extends RoomItemView{

  SwitchItemView(RoomItem roomItem) : super(
    child: new GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Icon(roomItem.icon.icon, size: 60.0),
          new Text(roomItem.name, style: TextStyle(height: 1, fontSize: 15)),
          getValueView(roomItem as SwitchItem),
        ]
      )
    )
  );

  static void onTap() {
    print("switch tap");
  }

  static Widget getValueView(SwitchItem switchItem){
    return new Switch(value: switchItem.value, onChanged: (bool value) {});
  }
}