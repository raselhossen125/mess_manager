// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/pages/login_page.dart';
import 'package:mess_manager/pages/register_page.dart';
import 'package:mess_manager/providers/meal_provider.dart';
import 'package:provider/provider.dart';

import 'pages/add_meal_cost_page.dart';
import 'pages/add_meal_page.dart';
import 'pages/add_member_money_page.dart';
import 'pages/forgetpassword_page.dart';
import 'untils/custom_colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MealProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> pokeballRedSwatch = {
      50: Color.fromARGB(255, 255, 88, 88),
      100: Color.fromARGB(255, 255, 88, 88),
      200: Color.fromARGB(255, 255, 88, 88),
      300: Color.fromARGB(255, 255, 88, 88),
      400: Color.fromARGB(255, 255, 88, 88),
      500: Color.fromARGB(255, 255, 88, 88),
      600: Color.fromARGB(255, 255, 88, 88),
      700: Color.fromARGB(255, 255, 88, 88),
      800: Color.fromARGB(255, 255, 88, 88),
      900: Color.fromARGB(255, 252, 70, 70),
    };
    MaterialColor pokeballRed = MaterialColor(0xffFC4646, pokeballRedSwatch);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: pokeballRed,
      ),
      initialRoute: LogInPage.routeName,
      routes: {
        LogInPage.routeName: (context) => LogInPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        ForgetPasswordPage.routeName: (context) => ForgetPasswordPage(),
        HomePage.routeName: (context) => HomePage(),
        AddMealPage.routeName: (context) => AddMealPage(),
        AddMealCostPage.routeName: (context) => AddMealCostPage(),
        AddMemberMoneyPage.routeName: (context) => AddMemberMoneyPage(),
      },
    );
  }
}
