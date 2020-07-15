import 'package:flutter/material.dart';
import 'package:homevee_app/gui/roomitems/roomitemview.dart';
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: getColumnCount()),
        itemCount: roomItems.length + 1,
        itemBuilder: (context, index) {
          if (index == roomItems.length) {
            return _buildProgressIndicator();
          } else {
            return RoomItemView.createFromRoomItem(roomItems[index]);
          }
        }
      )
    );
  }

  int getColumnCount(){
    if(roomItems.isEmpty) return 1;

    double width = MediaQuery.of(context).size.width;

    int itemWidth = 200;

    int columnCount = (width/itemWidth).round();

    return (columnCount < 1) ? 1 : columnCount;
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