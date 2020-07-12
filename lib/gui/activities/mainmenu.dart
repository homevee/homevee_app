import 'package:flutter/material.dart';
import 'package:homevee_app/gui/fragments/overview.dart';
import 'package:homevee_app/gui/fragments/room.dart';
import 'package:homevee_app/model/draweritem.dart';
import '../../model/room.dart';
import 'voicecommand.dart';
import '../../system/icons.dart' as icons;

class MainMenu extends StatefulWidget {

  final List<Room> roomList;

  List<DrawerItem> drawerItems;

  MainMenu(this.roomList){
    drawerItems = buildDrawerList();
  }

  @override
  State<StatefulWidget> createState() {
    return new MainMenuState();
  }

  List<DrawerItem> buildDrawerList(){
    List<DrawerItem> drawerList = new List();

    drawerList.add(new DrawerItem("Dashboard", icons.getDrawerIcon("dashboard"), "dashboard"));
    drawerList.add(new DrawerItem("Übersicht", icons.getDrawerIcon("overview"), "overview"));

    drawerList.addAll(buildDrawerRoomList());

    drawerList.add(new DrawerItem("Einstellungen", icons.getDrawerIcon("settings"), "settings"));

    return drawerList;
  }

  List<DrawerItem> buildDrawerRoomList(){
    List<DrawerItem> drawerRoomList = new List();

    for(final room in roomList){
      drawerRoomList.add(new DrawerItem(room.name, icons.getDrawerIcon(room.icon), room.id.toString()));
    }

    return drawerRoomList;
  }

  List<DrawerItem> buildFixedNavigationDrawerList(){
    List<DrawerItem> drawerFixedList = new List();

    //drawerFixedList.add(new DrawerItem("", icons.getDrawerIcon(""), ""));

    return drawerFixedList;
  }
}

class MainMenuState extends State<MainMenu> {
  String selectedDrawerId = "dashboard";

  _onSelectItem(int index) {
    setState(() => selectedDrawerId = widget.drawerItems[index].id);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var drawerItem = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: drawerItem.icon,
            title: new Text(drawerItem.title),
            selected: selectedDrawerId == drawerItem.id,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.drawerItems.firstWhere((element) => element.id == selectedDrawerId).title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VoiceCommandActivity()),
              );
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: widget.drawerItems.firstWhere((element) => element.id == selectedDrawerId).fragment
    );
  }
}