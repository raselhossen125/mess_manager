// ignore_for_file: unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MealProvider extends ChangeNotifier {
  bool isDark = false;
  String? pickeddate;
  double chipValue = 0.0;
  bool isLogedIn = false;
  String? latestValue;
  String dpSelectedItems = 'Leo Mesi';

  var dropdown_items = [
    'Leo Mesi',
    'Ronaldo',
    'Salah',
    'Neymer',
    'M Bappe',
    'Sadio Mane',
    'Pogba',
  ];

  dropDownItemChange(String? newValue) {
    dpSelectedItems = newValue!;
    latestValue = newValue;
    notifyListeners();
  }

  LogedIn(bool logInStatus) {
    isLogedIn = logInStatus;
    notifyListeners();
  }

  updateDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }

  Future<void>showDatePickerDialog(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      pickeddate = DateFormat('dd/MM/yyyy').format(selectedDate);
    }
    notifyListeners();
  }

  incrementMeal() {
    if (chipValue != 30) {
      chipValue = chipValue + 0.5;
    }
    notifyListeners();
  }

  decrementMeal() {
    if(chipValue!=0.0) {
      chipValue = chipValue - 0.5;
    }
    notifyListeners();
  }
}