import 'package:flutter/material.dart';

class EmptyItem extends Card{
  EmptyItem(String title, String message) : super(child: new ListTile(
    leading: Icon(Icons.list, size: 40,),
    title: new Text(title, style: new TextStyle(fontSize: 20)),
    subtitle: new Text(message, style: new TextStyle(fontSize: 15)),
  ));
}