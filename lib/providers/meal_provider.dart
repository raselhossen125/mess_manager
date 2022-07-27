// ignore_for_file: unused_element, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mess_manager/providers/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/addMember_models.dart';

class MealProvider extends ChangeNotifier {
  bool isDark = false;
  String? pickeddate;
  double chipValue = 0.0;
  String selectedValue = 'Chose';
  List<String> dropdown_items = [];

  dpDwnControll(BuildContext context) {
    List<AddMemberModel> member = 
        Provider.of<DBProvider>(context, listen: false).allMemberList;
    member.forEach((element) {
      dropdown_items.add(element.name);
    });
  }

  dropDownItemChange(String newValue) {
    selectedValue = newValue;
    notifyListeners();
  }

  Future<bool> setLogInStatus(bool ststus) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool("isLoggedIn", ststus);
  }

  Future<bool> getLogInStatus() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("isLoggedIn") ?? false;
  }

  setManagerId(int managerId) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt("managerId", managerId);
  }

  getManagerId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt("managerId");
  }

  updateDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }

  Future<void> showDatePickerDialog(BuildContext context) async {
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
    if (chipValue != 0.0) {
      chipValue = chipValue - 0.5;
    }
    notifyListeners();
  }
}
