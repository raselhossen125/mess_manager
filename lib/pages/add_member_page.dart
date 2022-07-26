

import 'package:flutter/material.dart';
import 'package:mess_manager/models/addMember_models.dart';
import 'package:mess_manager/providers/db_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../untils/custom_colors.dart';

class AddMemberPage extends StatelessWidget {
  static const routeName = '/add-member';

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text('Add Member'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: CustomColors.appColor),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset('images/person-icon.png'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Add New Member',
                  style: TextStyle(
                    color: CustomColors.appColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  cursorColor: CustomColors.appColor,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: CustomColors.appColor,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 10),
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: CustomColors.appColor,
                    ),
                    hintText: "Enter Member's Name",
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  cursorColor: CustomColors.appColor,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: CustomColors.appColor,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 10),
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: CustomColors.appColor,
                    ),
                    hintText: "Member's Email Address(valid)",
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    saveAddMember(context);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomColors.appColor,
                    ),
                    child: const Center(
                      child: Text(
                        'Add In Your Mess',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveAddMember(BuildContext context) async{
    var member = AddMemberModel(
      name: nameController.text,
      email: emailController.text,
      managerId: 5,
    );
    print(member.toString());
    final status = await Provider.of<DBProvider>(context, listen: false)
        .addNewMember(member);
    if (status) {
      Navigator.of(context).pop();
      print(member.toString());
    }
  }
}
