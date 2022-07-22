// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../untils/custom_colors.dart';

class CustomContainerWidget extends StatelessWidget {
  Widget child;

  CustomContainerWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomColors.appColor, width: 3),
          ),
          child: child,
        ),
      ],
    );
  }
}
