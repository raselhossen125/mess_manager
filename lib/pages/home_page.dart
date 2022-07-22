// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mess_manager/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../untils/custom_colors.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/custom_row_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color myBGColor = Provider.of<MealProvider>(context).isDark
        ? Colors.black
        : Colors.white.withOpacity(0.9);
    Color myColor = Provider.of<MealProvider>(context).isDark
        ? Colors.white.withOpacity(0.8)
        : Colors.black;
    return Scaffold(
      backgroundColor: myBGColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.appColor,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Image.asset(
                      'images/menu.png',
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rasel Hossen',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: CustomColors.iconColor.withOpacity(0.9)),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Manager',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: CustomColors.iconColor.withOpacity(0.9)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Consumer<MealProvider>(
                      builder: (context, provider, _) => IconButton(
                        onPressed: () {
                          provider.updateDarkMode();
                        },
                        icon: Icon(provider.isDark
                            ? Icons.light_mode
                            : Icons.dark_mode),
                        color: CustomColors.iconColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              size: 30,
                              color: myColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Bachelor point , ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: myColor,
                              ),
                            ),
                            Text(
                              'June 2022',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: myColor,
                              ),
                            ),
                          ],
                        ),
                        CustomRowWidget(
                          icon: Icons.home_outlined,
                          text: 'Mess Balance                     ',
                          value: 0.00,
                        ),
                        CustomRowWidget(
                          icon: Icons.home_outlined,
                          text: 'Total Deposit                       ',
                          value: 0.00,
                        ),
                        CustomRowWidget(
                          icon: Icons.home_outlined,
                          text: 'Mess Total Meal Cost        ',
                          value: 0.00,
                        ),
                        CustomRowWidget(
                          icon: Icons.home_outlined,
                          text: 'Mess Total Meal                 ',
                          value: 0.00,
                        ),
                        CustomRowWidget(
                          icon: Icons.home_outlined,
                          text: 'Mess Meal Rate                  ',
                          value: 0.00,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 170,
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Column(
                        children: [
                          SizedBox(height: 7),
                          Text('Personal Info'),
                          Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomContainerWidget(
                                      child: Center(
                                        child: FittedBox(child: Text('0.0')),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text('My Meal'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomContainerWidget(
                                      child: Center(
                                        child:
                                            FittedBox(child: Text('0.00 tk')),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text('My Deposit'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomContainerWidget(
                                      child: Center(
                                        child:
                                            FittedBox(child: Text('0.00 tk')),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text('My Cost'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomContainerWidget(
                                      child: Center(
                                        child:
                                            FittedBox(child: Text('0.00 tk')),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Balance'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.add,
        foregroundColor: CustomColors.iconColor,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: CustomColors.appColor,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        animationDuration: Duration(milliseconds: 250),
        spacing: 10,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            backgroundColor: CustomColors.appColor,
            labelBackgroundColor: CustomColors.appColor,
            child: Icon(
              Icons.restaurant,
              color: CustomColors.iconColor,
            ),
            label: 'Add Meal',
            labelStyle: TextStyle(color: CustomColors.iconColor),
          ),
          SpeedDialChild(
            backgroundColor: CustomColors.appColor,
            labelBackgroundColor: CustomColors.appColor,
            child: Icon(
              Icons.shopping_cart,
              color: CustomColors.iconColor,
            ),
            label: 'Add Meal Cost',
            labelStyle: TextStyle(color: CustomColors.iconColor),
          ),
          SpeedDialChild(
            backgroundColor: CustomColors.appColor,
            labelBackgroundColor: CustomColors.appColor,
            child: Icon(
              Icons.money,
              color: CustomColors.iconColor,
            ),
            label: 'Add Members Money',
            labelStyle: TextStyle(color: CustomColors.iconColor),
          ),
          SpeedDialChild(
            backgroundColor: CustomColors.appColor,
            labelBackgroundColor: CustomColors.appColor,
            child: Icon(
              Icons.alarm_on,
              color: CustomColors.iconColor,
            ),
            label: 'Active Month Details',
            labelStyle: TextStyle(color: CustomColors.iconColor),
          ),
        ],
      ),
    );
  }
}
