// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:mess_manager/pages/forgetpassword_page.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/pages/register_page.dart';
import 'package:mess_manager/providers/db_provider.dart';
import 'package:mess_manager/providers/meal_provider.dart';
import 'package:provider/provider.dart';

import '../untils/custom_colors.dart';

class LogInPage extends StatefulWidget {
  static const routeName = '/logIn-page';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool passObsecure = true;
  bool isLoading = false;
  String value = '';

  final email_Controller = TextEditingController();
  final password_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email_Controller.text;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
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
                child: Image.asset('images/R.png'),
              ),
              const SizedBox(height: 20),
              Text(
                'Log In As Mess Manager',
                style: TextStyle(
                  color: CustomColors.appColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: email_Controller,
                cursorColor: CustomColors.appColor,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: CustomColors.appColor, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 10),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.email,
                    color: CustomColors.appColor,
                  ),
                  hintText: "Manager's Email",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: password_Controller,
                obscureText: passObsecure,
                cursorColor: CustomColors.appColor,
                style: TextStyle(
                    color: CustomColors.appColor, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 10),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: CustomColors.appColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passObsecure ? Icons.visibility : Icons.visibility_off,
                      color: CustomColors.appColor,
                    ),
                    onPressed: () {
                      setState(() {
                        passObsecure = !passObsecure;
                      });
                    },
                  ),
                  hintText: "Manager's Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ForgetPasswordPage.routeName);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Consumer<DBProvider>(
                builder: (context, provider, _) => InkWell(
                  onTap: () {
                    provider.getRegisterPersonByGmail(
                      email_Controller.text,
                      context,
                    );
                    if (provider.logedInList.isNotEmpty) {
                      if (provider.logedInList[0].password ==
                          password_Controller.text) {
                        int? managerId = provider.logedInList[0].id;
                        Provider.of<MealProvider>(context, listen: false)
                            .setLogInStatus(true);
                        Provider.of<MealProvider>(context, listen: false)
                            .setManagerId(managerId!);
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      }
                    }
                    return null;
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomColors.appColor,
                    ),
                    child: Center(
                      child:
                          // isLoading ? CircularProgressIndicator(color: Colors.white,) :
                          Text(
                        'Log In',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Not Yet Registered? Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegisterPage.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
