

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:mess_manager/db/member_db_helper.dart';
import 'package:provider/provider.dart';
import '../db/db_helper.dart';
import '../models/addMember_models.dart';
import '../models/register_model.dart';
import 'meal_provider.dart';

class DBProvider extends ChangeNotifier {
  List<RegisterModel> registerList = [];
  List<RegisterModel> logedInList = [];

  Future<bool> addNewRegister(RegisterModel registerModel, BuildContext context) async {
    final rowId = await DBHelper.insertRegister(registerModel);
    if (rowId > 0) {
      Provider.of<MealProvider>(context, listen: false).setManagerId(rowId);
      registerModel.id = rowId;
      registerList.add(registerModel);
      return true;
    }
    return false;
  }

  Future<RegisterModel>getRegisterPersonByGmail(String gmail, BuildContext context) async{
    return DBHelper.getRegisterPersonByGmail(gmail);
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
