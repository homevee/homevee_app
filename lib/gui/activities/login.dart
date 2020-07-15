import 'package:flutter/material.dart';
import 'package:homevee_app/gui/activities/mainmenu.dart';
import 'package:homevee_app/gui/dialogs.dart';

import 'package:homevee_app/service/login.dart' as loginService;
import 'package:homevee_app/system/serverdata.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController remoteIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getUserdata().then((userData) => {this.autoLoginSetup(userData)});

    return Scaffold(
        appBar: AppBar(
          title: Text('Homevee'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[

                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Benutzername',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Passwort',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: remoteIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Remote-ID',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Passwort vergessen'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        this.doLogin();
                      },
                    )),
              ],
            )));
  }

  void autoLoginSetup(UserData userData){
    usernameController.text = userData.username;
    passwordController.text = userData.password;
    remoteIdController.text = userData.remoteId;

    if(userData.username != null && userData.password != null && userData.remoteId != null){
      doLogin();
    }
  }

  void doLogin(){
    loginService.login(usernameController.text,
                            passwordController.text,
                            remoteIdController.text.toUpperCase()).then((roomList) => {
      if(roomList != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainMenu(roomList)),
        )
      }
      else{
        showAlertDialog(context, "Login fehlgeschlagen", "Login fehlgeschlagen, bitte versuche es erneut.")
      }
    });
  }
}