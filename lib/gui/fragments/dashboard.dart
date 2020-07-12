import 'package:flutter/material.dart';

class DashboardFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DashboardFragmentState();
  }
}

class DashboardFragmentState extends State<DashboardFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Text("Dashboard")
    );
  }
}