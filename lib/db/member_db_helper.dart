import 'package:mess_manager/models/register_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/addMember_models.dart';

class MemberDbhelper {
  static const createTableMember = '''
  create table $tableMember(
  $tableMemberColId integer primary key,
  $tableMemberColName text,
  $tableMemberColEmail text,
  $tableRegisterColId integer
  )
  ''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'member.db');

    return openDatabase(dbPath, version: 1, onCreate: (db, value) {
      db.execute(createTableMember);
    });
  }

  static Future<int> insertMember(AddMemberModel addMemberModel) async {
    final db = await open();
    return db.insert(tableMember, addMemberModel.toMap());
  }

  static Future<List<AddMemberModel>> getAllMemberByManagerId(
      int managerId) async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableMember,
        where: '$tableRegisterColId = ?', whereArgs: [managerId]);
    return List.generate(
        mapList.length, (index) => AddMemberModel.fromMap(mapList[index]));
  }

  static Future<int> deleteMember(int id) async{
    final db = await open();
    return db.delete(tableMember, where: '$tableMemberColId = ?', whereArgs: [id]);
  }

}
