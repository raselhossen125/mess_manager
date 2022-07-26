

import 'package:flutter/cupertino.dart';
import 'package:mess_manager/db/member_db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/db_helper.dart';
import '../models/addMember_models.dart';
import '../models/register_model.dart';

class DBProvider extends ChangeNotifier {
  List<RegisterModel> registerList = [];
  List<RegisterModel> logedInList = [];

  Future<bool> addNewRegister(RegisterModel registerModel) async {
    final rowId = await DBHelper.insertRegister(registerModel);
    if (rowId > 0) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('managerId', rowId);

      registerModel.id = rowId;
      registerList.add(registerModel);
      return true;
    }
    return false;
  }

  getRegisterPersonByGmail(String gmail, BuildContext context) async{
    DBHelper.getRegisterPersonByGmail(gmail).then((value) {
      logedInList = value;
      notifyListeners();
    });
  }

  List<AddMemberModel> memberList = [];

  Future<bool> addNewMember(AddMemberModel addMemberModel) async {
    final rowId = await MemberDbhelper.insertMember(addMemberModel);
    if (rowId > 0) {
      addMemberModel.id = rowId;
      memberList.add(addMemberModel);
      return true;
    }
    return false;
  }
}
