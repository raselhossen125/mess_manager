const String tableRegister = 'tbl_register';
const String tableRegisterColId = 'manager_id';
const String tableRegisterColImageUrl = 'managerImageUrl';
const String tableRegisterColName = 'managerName';
const String tableRegisterColEmail = 'managerEmail';
const String tableRegisterColPhone = 'managerphone';
const String tableRegisterColUniversity = 'manageruniversity';
const String tableRegisterColPassword = 'password';
const String tableRegisterColConfPassword = 'confPassword';

class RegisterModel {
  int? id;
  String? managerImageUrl;
  String managerName;
  String managerEmail;
  String managerphone;
  String manageruniversity;
  String password;
  String confPassword;

  RegisterModel({
    this.id,
    this.managerImageUrl,
    required this.managerName,
    required this.managerEmail,
    required this.managerphone,
    required this.manageruniversity,
    required this.password,
    required this.confPassword,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableRegisterColImageUrl: managerImageUrl,
      tableRegisterColName: managerName,
      tableRegisterColEmail: managerEmail,
      tableRegisterColPhone: managerphone,
      tableRegisterColUniversity: manageruniversity,
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
        managerImageUrl: map[tableRegisterColImageUrl],
        managerName: map[tableRegisterColName],
        managerEmail: map[tableRegisterColEmail],
        managerphone: map[tableRegisterColPhone],
        manageruniversity: map[tableRegisterColUniversity],
        password: map[tableRegisterColPassword],
        confPassword: map[tableRegisterColConfPassword],
      );

  @override
  String toString() {
    return 'RegisterModel{id: $id, managerImageUrl: $managerImageUrl, managerName: $managerName, managerEmail: $managerEmail, managerphone: $managerphone, manageruniversity: $manageruniversity, password: $password, confPassword: $confPassword}';
  }
}
