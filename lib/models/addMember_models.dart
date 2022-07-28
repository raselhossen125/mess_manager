// ignore_for_file: unused_element

import 'package:mess_manager/models/register_model.dart';

const String tableMember = 'tbl_member';
const String tableMemberColId = 'id';
const String tableMemberColName = 'name';
const String tableMemberColEmail = 'email';

class AddMemberModel {
  int? id;
  final String name;
  final String email;
  final int managerId;

  AddMemberModel({
    this.id,
    required this.name,
    required this.email,
    required this.managerId,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableMemberColName: name,
      tableMemberColEmail: email,
      tableRegisterColId: managerId
    };
    if (id != null) {
      map[tableMemberColId] = id;
    }
    return map;
  }

  factory AddMemberModel.fromMap(Map<String, dynamic> map) => AddMemberModel(
        id: map[tableMemberColId],
        name: map[tableMemberColName],
        email: map[tableMemberColEmail],
        managerId: map[tableRegisterColId],
  );

  @override
  String toString() {
    return 'AddMemberModel{id: $id, name: $name, email: $email, managerId: $managerId}';
  }
}
