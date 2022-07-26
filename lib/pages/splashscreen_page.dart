// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../untils/custom_colors.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('images/meal-logo.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                "Easy Way Mess Management",
                style: TextStyle(
                  color: CustomColors.appColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 120),
              const CircularProgressIndicator(
                color: CustomColors.appColor,
                strokeWidth: 3.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  init() {
    Timer(
      Duration(milliseconds: 2000),
      () => Provider.of<MealProvider>(context, listen: false)
          .getLogInStatus()
          .then((value) {
        value
            ? Navigator.of(context).pushReplacementNamed(HomePage.routeName)
            : Navigator.of(context).pushReplacementNamed(LogInPage.routeName);
      }),
    );
  }
}
