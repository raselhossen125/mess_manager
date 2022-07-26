// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:mess_manager/models/addMember_models.dart';
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

  static Future<List<RegisterModel>> getRegisterPersonByGmail(String gmail) async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = (await db.query(tableRegister, where: '$tableRegisterColEmail = ?', whereArgs: [gmail]));
    return List.generate(mapList.length, (index) => RegisterModel.fromMap(mapList[index]));
  }
}