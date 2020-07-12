import 'package:flutter/material.dart';

class VoiceCommandActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sprachbefehl"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Center(

      ),
    );
  }
}