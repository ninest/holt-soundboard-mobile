import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  setTheme(String theme) {
    var settingsBox = Hive.box('settings');
    settingsBox.put('theme', theme);
    notifyListeners();
  }
}