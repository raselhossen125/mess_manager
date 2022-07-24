// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MealProvider extends ChangeNotifier {
  bool isDark = false;
  String? pickeddate;

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
}