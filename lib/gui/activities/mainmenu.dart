import 'package:flutter/material.dart';
import 'package:homevee_app/model/room.dart';
import 'voicecommand.dart';

class MainMenu extends StatelessWidget {

  final List<Room> roomList;

  MainMenu({Key key, @required this.roomList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homevee"),
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
      body: Center(

      ),
    );
  }
}