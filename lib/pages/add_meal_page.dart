// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/meal_provider.dart';
import '../untils/custom_colors.dart';

class AddMealPage extends StatelessWidget {
  static const routeName = '/addMeal-page';

  double chipValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text('Add Members Meal'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.appColor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 16),
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 110),
                      Consumer<MealProvider>(
                        builder: (context, provider, _) => Text(
                          provider.pickeddate == null
                              ? DateFormat('dd/MM/yyyy').format(DateTime.now())
                              : provider.pickeddate!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Set Members Meal Numbers',
                ),
                SizedBox(height: 15),
                Container(
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
                            'Leo Messi',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.3, color: Colors.grey)),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: CustomColors.appColor,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Chip(
                            backgroundColor: CustomColors.appColor,
                            label: Text(
                              chipValue.toString(), style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.3, color: Colors.grey)),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: CustomColors.appColor,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
