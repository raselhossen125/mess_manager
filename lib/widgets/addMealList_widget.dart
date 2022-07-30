// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/addMember_models.dart';
import '../providers/meal_provider.dart';
import '../untils/custom_colors.dart';

class AddMealListWidget extends StatefulWidget {
  AddMemberModel addMemberModel;

  AddMealListWidget({
    required this.addMemberModel,
  });

  @override
  State<AddMealListWidget> createState() => _AddMealListWidgetState();
}

class _AddMealListWidgetState extends State<AddMealListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MealProvider>(
      builder: (context, provider, _) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  child: Image.asset(
                    'images/R.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.addMemberModel.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    provider.decrementMeal();
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(
                            color: CustomColors.appColor, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Chip(
                  backgroundColor: CustomColors.appColor,
                  label: Text(
                    provider.chipValue.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    provider.incrementMeal();
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: CustomColors.appColor, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
