import 'package:flutter/material.dart';

class MealProvider extends ChangeNotifier {
  bool isDark = false;

  updateDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }
}