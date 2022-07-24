// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mess_manager/untils/custom_colors.dart';

class DrawerListTileWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  DrawerListTileWidget({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(
          icon,
          color: CustomColors.appColor,
        ),
        title: Text(text),
      ),
    );
  }
}
