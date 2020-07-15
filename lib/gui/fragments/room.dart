import 'package:flutter/material.dart';
import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';
import 'package:homevee_app/service/roomdata.dart';

class RoomFragment extends StatefulWidget {
  String roomId;

  RoomFragment(this.roomId);

  @override
  RoomFragmentState createState() => RoomFragmentState();
}

class RoomFragmentState extends State<RoomFragment> {
  List<RoomItem> roomItems = new List();

  bool isPerformingRequest = false;

  @override
  void didUpdateWidget(RoomFragment oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.roomId != widget.roomId) {
      this.updateChildWithParent();
    }
  }

  void updateChildWithParent() {
    loadRoomItems();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount: roomItems.length + 1,
        itemBuilder: (context, index) {
          if (index == roomItems.length) {
            return _buildProgressIndicator();
          } else {
            return ListTile(title: new Text(roomItems[index].name));
          }
        },
      )
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(32.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    roomItems = new List();
    loadRoomItems();
  }

  loadRoomItems() async{
    if(!isPerformingRequest) {
      setState((){
        roomItems = new List();
        isPerformingRequest = true;
      });
      List<RoomItem> items = await getRoomData(widget.roomId);
      setState(() {
        roomItems.addAll(items);
        isPerformingRequest = false;
      });
    }
  }
}