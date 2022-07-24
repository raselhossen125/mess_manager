import 'package:flutter/material.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/providers/meal_provider.dart';
import 'package:provider/provider.dart';

import 'pages/add_meal_cost_page.dart';
import 'pages/add_meal_page.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AddMealPage.routeName: (context) => AddMealPage(),
        AddMealCostPage.routeName: (context) => AddMealCostPage(),
      },
    );
  }
}
