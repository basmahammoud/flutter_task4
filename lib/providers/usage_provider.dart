import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsageProvider extends ChangeNotifier {
  int _usageCount = 0;

  int get usageCount => _usageCount;

  // Retrieving recorded data
  Future<void> loadUsageCount() async {
    final prefs = await SharedPreferences.getInstance();

    _usageCount = prefs.getInt('usageCount') ?? 0;

    notifyListeners();
  }

  // Increment usage count
  Future<void> incrementUsage() async {
    final prefs = await SharedPreferences.getInstance();
    _usageCount++;
    await prefs.setInt('usageCount', _usageCount);
    notifyListeners();
  }
}
