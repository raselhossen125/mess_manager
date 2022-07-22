// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/custom_appbar_widget.dart';

class AddMealPage extends StatelessWidget {
  static const routeName = '/addMeal-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      // appBar: AppBar(
      //   title: Text('Add Meal Page'),
      // ),
      body: Column(
        children: [
          CustomAppBarWidget(),
        ],
      ),
    );
  }
}