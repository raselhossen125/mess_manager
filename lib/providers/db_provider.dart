// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:mess_manager/db/member_db_helper.dart';
import 'package:provider/provider.dart';
import '../db/db_helper.dart';
import '../models/addMember_models.dart';
import '../models/register_model.dart';
import 'meal_provider.dart';

class DBProvider extends ChangeNotifier {
  List<RegisterModel> registerList = [];
  List<AddMemberModel> memberList = [];
  List<AddMemberModel> allMemberList = [];

  Future<bool> addNewRegister(
      RegisterModel registerModel, BuildContext context) async {
    final rowId = await DBHelper.insertRegister(registerModel);
    if (rowId > 0) {
      Provider.of<MealProvider>(context, listen: false).setManagerId(rowId);
      registerModel.id = rowId;
      registerList.add(registerModel);
      return true;
    }
    return false;
  }

  Future<RegisterModel> getRegisterPersonByGmail(
      String gmail, BuildContext context) async {
    return DBHelper.getRegisterPersonByGmail(gmail);
  }

  Future<bool> addNewMember(AddMemberModel addMemberModel) async {
    final rowId = await MemberDbhelper.insertMember(addMemberModel);
    if (rowId > 0) {
      addMemberModel.id = rowId;
      memberList.add(addMemberModel);
      return true;
    }
    return false;
  }

  Future<RegisterModel> getLogInPersonByManagerId(BuildContext context) async {
    int managerId =
        await Provider.of<MealProvider>(context, listen: false).getManagerId();
    return DBHelper.getLogInPersonByManagerId(managerId);
  }

  getAllMemberByManagerId(BuildContext context) async {
    int managerId =
        await Provider.of<MealProvider>(context, listen: false).getManagerId();
    MemberDbhelper.getAllMemberByManagerId(managerId).then((value) {
      allMemberList = value;
      notifyListeners();
    });
  }

  updateManagerInformation(
      BuildContext context, String colomName, String text) async {
    int managerId =
        await Provider.of<MealProvider>(context, listen: false).getManagerId();
    DBHelper.updateManagerInfo(managerId, colomName, text);
    notifyListeners();
  }

  deleteMember(int id) async {
    final rowId = await MemberDbhelper.deleteMember(id);
    if (rowId > 0) {
      allMemberList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}
