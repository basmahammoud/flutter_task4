import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider extends ChangeNotifier {
  String? _username;
  bool _isLoggedIn = false;
  DateTime? _lastOpenTime;

  String? get username => _username;
  bool get isLoggedIn => _isLoggedIn;
  DateTime? get lastOpenTime => _lastOpenTime;

  //Retrieving recorded data
  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username');
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // استرجاع آخر وقت فتح للتطبيق
    final lastOpenMillis = prefs.getInt('lastOpenTime');
    if (lastOpenMillis != null) {
      _lastOpenTime = DateTime.fromMillisecondsSinceEpoch(lastOpenMillis);
    }

    notifyListeners();
  }

  //User Login
  Future<void> login(String username) async {
    final prefs = await SharedPreferences.getInstance();

    _username = username;
    _isLoggedIn = true;
    _lastOpenTime = DateTime.now(); // تحديث وقت آخر فتح

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


    // ubpate last open time
  Future<void> updateLastOpenTime() async {
    final prefs = await SharedPreferences.getInstance();
    _lastOpenTime = DateTime.now();
    await prefs.setInt('lastOpenTime', _lastOpenTime!.millisecondsSinceEpoch);
    notifyListeners();
  }

  //Resetting App Data
  Future<void> resetAppData() async {
    final prefs = await SharedPreferences.getInstance();

    // مسح كل البيانات المخزنة محليًا
    await prefs.clear();

    // مسح بيانات الجلسة في الـ provider
    _username = null;
    _isLoggedIn = false;

    notifyListeners();
  }
}
