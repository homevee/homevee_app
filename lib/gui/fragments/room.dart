import 'package:flutter/material.dart';

class RoomFragment extends StatefulWidget {
  String roomId;

  RoomFragment(this.roomId);

  @override
  State<StatefulWidget> createState() {
    return new RoomFragmentState();
  }
}

class RoomFragmentState extends State<RoomFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Text("Raum #" + widget.roomId)
    );
  }
}