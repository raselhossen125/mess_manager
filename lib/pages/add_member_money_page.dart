// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mess_manager/providers/meal_provider.dart';
import 'package:mess_manager/untils/custom_colors.dart';
import 'package:provider/provider.dart';

class AddMemberMoneyPage extends StatelessWidget {
  static const routeName = '/addMemberMoney-page';

  @override
  Widget build(BuildContext context) {
    Provider.of<MealProvider>(context).dpDwnControllDeposit(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text('Add Members Deposit'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add Members Money',
                  style: TextStyle(
                    color: CustomColors.appColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 15),
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
                                ? DateFormat('dd/MM/yyyy')
                                    .format(DateTime.now())
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
                TextFormField(
                  cursorColor: CustomColors.appColor,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: CustomColors.appColor,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 20),
                    focusColor: Colors.white,
                    hintText: "Enter Deposit Amount",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Select Members Who Will Deposit',
                ),
                SizedBox(height: 15),
                Consumer<MealProvider>(
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
                              provider.selectedValueDeposit,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                            Spacer(),
                            DropdownButton(
                                borderRadius: BorderRadius.circular(15),
                                underline: Text(""),
                                dropdownColor: Colors.white,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: CustomColors.appColor,
                                ),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 18),
                                items:
                                    provider.dropdown_items_deposit.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  provider.dropDownItemChangeDeposit(newValue as String);
                                },
                              ),
                          ],
                        )),
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
