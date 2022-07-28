// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, unused_element, dead_code

// import 'package:flutter/material.dart';
// import 'package:mess_manager/providers/db_provider.dart';
// import 'package:mess_manager/untils/custom_colors.dart';
// import 'package:provider/provider.dart';
// import '../models/addMember_models.dart';

// class AllMemberListWidget extends StatefulWidget {
//   AddMemberModel addMemberModel;

//   AllMemberListWidget({
//     required this.addMemberModel,
//   });

//   @override
//   State<AllMemberListWidget> createState() => _AllMemberListWidgetState();
// }

// class _AllMemberListWidgetState extends State<AllMemberListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }

//   Future<bool?> _showConformationDialog(DismissDirection direction) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Delete Member"),
//         content: Text("Are you sure delete this member"),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context, false),
//               child: Text("No")),
//           TextButton(
//               onPressed: () => Navigator.pop(context, true),
//               child: Text("Yes")),
//         ],
//       ),
//     );
//   }
// }
