import 'package:flutter/cupertino.dart';
import '../db/db_helper.dart';
import '../models/register_model.dart';

class DBProvider extends ChangeNotifier {
  List<RegisterModel> registerList = [];
  List<RegisterModel> logedInList = [];

  Future<bool> addNewRegister(RegisterModel registerModel) async {
    final rowId = await DBHelper.insertRegister(registerModel);
    if (rowId > 0) {
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
}
