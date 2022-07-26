
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
}