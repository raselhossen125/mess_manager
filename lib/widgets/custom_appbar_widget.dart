// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          title: Text('Add Members Meal'),
        ),
      ),
    );
  }
}
