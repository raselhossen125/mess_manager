// ignore_for_file: use_build_context_synchronously, avoid_print, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors, curly_braces_in_flow_control_structures, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:mess_manager/models/register_model.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/pages/login_page.dart';
import 'package:provider/provider.dart';
import '../providers/db_provider.dart';
import '../providers/meal_provider.dart';
import '../untils/custom_colors.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/signIn-page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passObsecure = true;
  bool conPassObsecure = true;
  String errorText = '';

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: CustomColors.appColor),
                    borderRadius: BorderRadius.circular(100), //<-- SEE HERE
                  ),
                  child: Image.asset('images/R.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Sign Up As Mess Manager',
                  style: TextStyle(
                    color: CustomColors.appColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        cursorColor: CustomColors.appColor,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            color: CustomColors.appColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 10),
                          focusColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.person,
                            color: CustomColors.appColor,
                          ),
                          hintText: "Manager's Name",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name can not be empty';
                          }
                          if (value.length > 20) {
                            return 'Name must be in 20 character';
                          } else
                            null;
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: emailController,
                        cursorColor: CustomColors.appColor,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: CustomColors.appColor,
                            fontWeight: FontWeight.w500),
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
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return 'Email can not be empty';
                          } else
                            null;
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: passwordController,
                        obscureText: passObsecure,
                        cursorColor: CustomColors.appColor,
                        style: TextStyle(
                            color: CustomColors.appColor,
                            fontWeight: FontWeight.w500),
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
                              passObsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return 'Password can not be empty';
                          } else
                            null;
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        obscureText: conPassObsecure,
                        controller: conformPasswordController,
                        cursorColor: CustomColors.appColor,
                        style: TextStyle(
                            color: CustomColors.appColor,
                            fontWeight: FontWeight.w500),
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
                              conPassObsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: CustomColors.appColor,
                            ),
                            onPressed: () {
                              setState(() {
                                conPassObsecure = !conPassObsecure;
                              });
                            },
                          ),
                          hintText: "Manager's Password",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return 'Password can not be empty';
                          } else
                            null;
                          return null;
                        },
                      ),
                      SizedBox(height: 7,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          errorText,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                InkWell(
                  onTap: saveRegisterInfo,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomColors.appColor,
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18),
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
                      'Already Signed Up? Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(LogInPage.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveRegisterInfo() async {
    if (formKey.currentState!.validate()) {
      var p1 = passwordController.text;
      var p2 = conformPasswordController.text;
      RegisterModel? register;
      if (p1 == p2) {
        register = RegisterModel(
          managerName: nameController.text,
          managerEmail: emailController.text,
          password: passwordController.text,
          confPassword: conformPasswordController.text,
        );
        print(register.toString());
        final status = await Provider.of<DBProvider>(context, listen: false)
            .addNewRegister(register, context);
        if (status) {
          Provider.of<MealProvider>(context, listen: false).setLogInStatus(true);
          Navigator.pushReplacementNamed(context, HomePage.routeName);
          print(register.toString());
        }
      } else {
        setState(() {
          errorText = 'Both password are not same';
        });
      }
    }
  }
}
