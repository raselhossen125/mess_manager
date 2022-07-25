const String tableRegister = 'tbl_register';
const String tableRegisterColId = 'id';
const String tableRegisterColName = 'managerName';
const String tableRegisterColEmail = 'managerEmail';
const String tableRegisterColPassword = 'password';
const String tableRegisterColConfPassword = 'confPassword';

class RegisterModel {
  int? id;
  String managerName;
  String managerEmail;
  String password;
  String confPassword;

  RegisterModel({
    this.id,
    required this.managerName,
    required this.managerEmail,
    required this.password,
    required this.confPassword,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableRegisterColName: managerName,
      tableRegisterColEmail: managerEmail,
      tableRegisterColPassword: password,
      tableRegisterColConfPassword: confPassword,
    };
    if (id != null) {
      map[tableRegisterColId] = id;
    }
    return map;
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) => RegisterModel(
        id: map[tableRegisterColId],
        managerName: map[tableRegisterColName],
        managerEmail: map[tableRegisterColEmail],
        password: map[tableRegisterColPassword],
        confPassword: map[tableRegisterColConfPassword],
      );

  @override
  String toString() {
    return 'RegisterModel{id: $id, managerName: $managerName, managerEmail: $managerEmail, password: $password, confPassword: $confPassword}';
  }
}
