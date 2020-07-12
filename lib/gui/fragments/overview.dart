import 'package:flutter/material.dart';

class OverviewFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OverviewFragmentState();
  }
}

class OverviewFragmentState extends State<OverviewFragment>{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Text("Übersicht")
    );
  }
}