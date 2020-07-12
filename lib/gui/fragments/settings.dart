import 'package:flutter/material.dart';

class SettingsFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingsFragmentState();
  }
}

class SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Text("Einstellungen")
    );
  }
}