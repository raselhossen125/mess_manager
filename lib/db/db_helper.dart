// ignore_for_file: unused_local_variable, non_constant_identifier_names, equal_keys_in_map
import 'package:mess_manager/models/register_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const createTableContact = '''
  create table $tableRegister(
  $tableRegisterColId integer primary key,
  $tableRegisterColImageUrl text,
  $tableRegisterColName text,
  $tableRegisterColEmail text,
  $tableRegisterColPhone text,
  $tableRegisterColUniversity text,
  $tableRegisterColPassword text,
  $tableRegisterColConfPassword text
  )
  ''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'register.db');

    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(createTableContact);
    });
  }

  static Future<int> insertRegister(RegisterModel registerModel) async {
    final db = await open();

    return db.insert(tableRegister, registerModel.toMap());
  }

  static Future<RegisterModel> getRegisterPersonByGmail(String gmail) async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = (await db.query(tableRegister,
        where: '$tableRegisterColEmail = ?', whereArgs: [gmail]));
    if (mapList.isNotEmpty) {
      return RegisterModel.fromMap(mapList.first);
    }
    return RegisterModel(
        managerName: '',
        managerEmail: '',
        password: '',
        confPassword: '',
        managerphone: '',
        manageruniversity: '');
  }

  static Future<RegisterModel> getLogInPersonByManagerId(int managerId) async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = (await db.query(tableRegister,
        where: '$tableRegisterColId = ?', whereArgs: [managerId]));
    return RegisterModel.fromMap(mapList.first);
  }

  static updateManagerInfo(int managerId, String colomName, value) async {
    final db = await open();
    db.update(tableRegister, {colomName: value},
        where: '$tableRegisterColId = ?', whereArgs: [managerId]);
  }
}
