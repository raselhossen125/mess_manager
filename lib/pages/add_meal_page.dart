// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_cast, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mess_manager/providers/db_provider.dart';
import 'package:provider/provider.dart';
import '../providers/meal_provider.dart';
import '../untils/custom_colors.dart';
import '../widgets/addMealList_widget.dart';

class AddMealPage extends StatelessWidget {
  static const routeName = '/addMeal-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text('Add Members Meal'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Provider.of<MealProvider>(context, listen: false)
                      .showDatePickerDialog(context);
                },
                child: Container(
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
              ),
              SizedBox(height: 15),
              Text(
                'Set Members Meal Numbers',
              ),
              SizedBox(height: 15),
              Expanded(
                child: Consumer<DBProvider>(
                  builder: (context, provider, _) => ListView.builder(
                    itemCount: provider.allMemberList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: AddMealListWidget(
                            addMemberModel: provider.allMemberList[index]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
