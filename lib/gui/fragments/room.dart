import 'package:flutter/material.dart';
import 'package:homevee_app/gui/emptyitem.dart';
import 'package:homevee_app/gui/roomitems/roomitemview.dart';
import 'package:homevee_app/model/to/item/roomitems/roomitem.dart';
import 'package:homevee_app/service/device/device.dart';
import 'package:homevee_app/service/roomdata.dart';

class RoomFragment extends StatefulWidget {
  String roomId, roomName;

  RoomFragment(this.roomId, this.roomName);

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
      body: getBody()
    );
  }

  Widget getBody(){
    if(isPerformingRequest){
      return _buildProgressIndicator();
    }
    else if (roomItems.isEmpty) {
      return EmptyItem("Keine Elemente", "Im Raum '"+widget.roomName+"' gibt es noch keine Elemente.");
    }
    else {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: getColumnCount()),
          itemCount: roomItems.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => onTapped(index),
              child: RoomItemView.createFromRoomItem(roomItems[index]),
            );
          }
      );
    }
  }

  void onTapped(int index) async{
    RoomItem roomItem = roomItems[index];

    roomItem = await DeviceService.triggerDeviceAction(context, roomItem);

    setState(() {
      roomItems[index] = roomItem;
    });
  }

  int getColumnCount(){
    if(roomItems == null || roomItems.isEmpty) return 1;

    double width = MediaQuery.of(context).size.width;

    int itemWidth = 200;

    int columnCount = (width/itemWidth).round();

    return (columnCount < 1) ? 1 : columnCount;
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(32.0),
      child: new Center(
        child: new CircularProgressIndicator()
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    roomItems = null;
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