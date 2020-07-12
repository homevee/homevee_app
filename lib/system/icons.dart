import 'package:flutter/material.dart';

Icon getDrawerIcon(String key){
  /*switch(key){
    case "":
      return createFromAsset("images/icon_more.png");
  }*/
  return Icon(Icons.room);
}

Icon getSettingsIcon(String key){
  /*switch(key){
    case "":
      return createFromAsset("images/icon_more.png");
  }*/
  return Icon(Icons.room);
}

Icon getDeviceIcon(String key){
  /*switch(key){
    case "":
      return createFromAsset("images/icon_more.png");
  }*/
  return Icon(Icons.room);
}

Widget createFromAsset(String path){
  return ImageIcon(
    AssetImage(path),
    color: Color(0xcccccc),
  );
}