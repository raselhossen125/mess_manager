import 'package:mess_manager/models/register_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  static const createTableContact = '''
  create table $tableRegister(
  $tableRegisterColId integer primary key,
  $tableRegisterColName text,
  $tableRegisterColEmail text,
  $tableRegisterColPassword text,
  $tableRegisterColConfPassword text
  )
  ''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'register.db');

    return openDatabase(dbPath ,version: 1, onCreate: (db, version) {
      db.execute(createTableContact);
    });
  }

  static Future<int> insertRegister(RegisterModel registerModel) async {
    final db = await open();

    return db.insert(tableRegister, registerModel.toMap());
  }

}