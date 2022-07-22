// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal_provider.dart';

class CustomRowWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double value;

  CustomRowWidget({
    required this.icon,
    required this.text, 
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Color myColor = Provider.of<MealProvider>(context).isDark
        ? Colors.white.withOpacity(0.8)
        : Colors.black;
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: myColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: myColor,
          ),
        ),
        Text(
          ': '+value.toString()+' tk',
          style: TextStyle(
            fontSize: 14,
            color: myColor,
          ),
        ),
      ],
    );
  }
}
