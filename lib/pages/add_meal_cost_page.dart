// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mess_manager/providers/meal_provider.dart';
import 'package:mess_manager/untils/custom_colors.dart';
import 'package:provider/provider.dart';

class AddMealCostPage extends StatefulWidget {
  static const routeName = '/addMealCost-page';

  @override
  State<AddMealCostPage> createState() => _AddMealCostPageState();
}

class _AddMealCostPageState extends State<AddMealCostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text('Add Meal Cost Info'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add Meal Cost',
                  style: TextStyle(
                    color: CustomColors.appColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Meal cost means regular bazar cost which is related to meal rate',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Provider.of<MealProvider>(context).showDatePickerDialog(context);
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
                TextField(
                  cursorColor: CustomColors.appColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Enter Cost Amount",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: CustomColors.appColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Shoppers Name : ',
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                          child: Image.asset('images/R.png', fit: BoxFit.cover,),
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
                      ],
                    )
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.appColor,
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
