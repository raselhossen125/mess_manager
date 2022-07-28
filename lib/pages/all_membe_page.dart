// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/db_provider.dart';
import '../untils/custom_colors.dart';

class AllMemberPage extends StatefulWidget {
  static const routeName = '/all-members';

  @override
  State<AllMemberPage> createState() => _AllMemberPageState();
}

class _AllMemberPageState extends State<AllMemberPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DBProvider>(context, listen: false)
        .getAllMemberByManagerId(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text('All Members'),
      ),
      body: Consumer<DBProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.allMemberList.length,
          itemBuilder: (context, index) {
            final member = provider.allMemberList[index];
            return Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 6,
              ),
              child: Dismissible(
                key: UniqueKey(),
                confirmDismiss: _showConformationDialog,
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  provider.deleteMember(member.id!);
                },
                background: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                child: Container(
                  height: 65,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Image.asset(
                          'images/R.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15),
                      FittedBox(
                        child: Text(
                          member.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: CustomColors.appColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool?> _showConformationDialog(DismissDirection direction) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Member"),
        content: Text("Are you sure delete this member"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("No")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Yes")),
        ],
      ),
    );
  }
}
