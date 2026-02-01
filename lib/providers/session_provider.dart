import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider extends ChangeNotifier {
  String? _username;
  bool _isLoggedIn = false;

  String? get username => _username;
  bool get isLoggedIn => _isLoggedIn;


  //Retrieving recorded data
  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username');
    _isLoggedIn = prefs.getBool('isLoggedIn')?? false;
    notifyListeners();
  }

  //User Login
 Future<void> login(String username) async {
    final prefs = await SharedPreferences.getInstance();

    _username = username;
    _isLoggedIn = true;

    await prefs.setString('username', username);
    await prefs.setBool('isLoggedIn', true);

    notifyListeners();
  }

  //User logout
Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  _username = null;
  _isLoggedIn = false;

  await prefs.remove('username');
  await prefs.setBool('isLoggedIn', false);
  notifyListeners();
}

}