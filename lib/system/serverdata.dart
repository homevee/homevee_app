import 'package:shared_preferences/shared_preferences.dart';

class UserData{
  String username, password, remoteId;

  UserData(String username, String password, String remoteId){
    this.username = username;
    this.password = password;
    this.remoteId = remoteId;
  }
}

Future<void> updateUserData(String username, String password, String remoteId) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username);
  prefs.setString('password', password);
  prefs.setString('remoteId', remoteId);
}

Future<UserData> getUserdata() async{
  final prefs = await SharedPreferences.getInstance();

  UserData userData = new UserData(prefs.getString("username"),
      prefs.getString("password"),
      prefs.getString("remoteId"));

  return userData;
}

Future<void> deleteData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('username');
  prefs.remove('password');
  prefs.remove('remoteId');
}

Future<String> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

Future<String> getPassword() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

Future<String> getRemoteId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}