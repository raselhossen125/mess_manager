// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_local_variable, must_be_immutable, use_key_in_widget_constructors, unnecessary_cast

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mess_manager/pages/add_member_money_page.dart';
import 'package:mess_manager/pages/add_member_page.dart';
import 'package:mess_manager/pages/all_membe_page.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/pages/login_page.dart';
import 'package:mess_manager/pages/profile_page.dart';
import 'package:mess_manager/untils/custom_colors.dart';
import 'package:provider/provider.dart';
import '../models/register_model.dart';
import '../pages/add_meal_cost_page.dart';
import '../pages/add_meal_page.dart';
import '../providers/db_provider.dart';
import '../providers/meal_provider.dart';
import 'drawer_listTile_widget.dart';

class DrawerWidget extends StatelessWidget {
  RegisterModel? model;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // TODO drawer header start
            Container(
              width: double.infinity,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  FutureBuilder(
                    future: getData(context),
                    builder: (context, snapshort) {
                      if (snapshort.hasData) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: model?.managerImageUrl == null
                              ? Image.asset(
                                  'images/R.png',
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(model!.managerImageUrl.toString()),
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                        );
                      }
                      return CircularProgressIndicator(
                        color: Colors.white,
                      );
                    },
                  ),
                  SizedBox(height: 6),
                  FutureBuilder(
                    future: getData(context),
                    builder: (context, snapshort) {
                      if (snapshort.hasData) {
                        return Text(
                          model!.managerName,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        );
                      }
                      return CircularProgressIndicator(
                        color: Colors.white,
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  FutureBuilder(
                    future: getData(context),
                    builder: (context, snapshort) {
                      if (snapshort.hasData) {
                        return Text(
                          model!.managerEmail,
                          style: TextStyle(fontSize: 14),
                        );
                      }
                      return CircularProgressIndicator(
                        color: Colors.white,
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 28,
                    width: 200,
                    margin: EdgeInsets.only(bottom: 20),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Text('View Mess Settings'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            // TODO option start
            Expanded(
              child: ListView(
                children: [
                  DrawerListTileWidget(
                    icon: Icons.home,
                    text: 'Home',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.person,
                    text: 'Profile',
                    onPressed: () {
                      Navigator.of(context).pushNamed(ProfilePage.routeName).then((value) {
                        Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                      });
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.person_add,
                    text: 'Add Member',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AddMemberPage.routeName)
                          .then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      });
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.paid,
                    text: 'Add Member Money',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AddMemberMoneyPage.routeName)
                          .then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      });
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.restaurant,
                    text: 'Add Meal',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AddMealPage.routeName)
                          .then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      });
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.shopping_cart,
                    text: 'Add Meal Cost',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AddMealCostPage.routeName)
                          .then((value) {
                        Provider.of<MealProvider>(context, listen: false)
                            .dropdown_items_cost
                            .clear();
                      }).then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      });
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.person,
                    text: 'All Members',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AllMemberPage.routeName)
                          .then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      });
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                    child: Text(
                      'Options',
                      style: TextStyle(color: CustomColors.appColor),
                    ),
                  ),
                  DrawerListTileWidget(
                    icon: Icons.person_remove,
                    text: 'Remove Member',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.new_releases,
                    text: 'Start New Month',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.alarm_on,
                    text: 'Active Month Details',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                    },
                  ),
                  DrawerListTileWidget(
                    icon: Icons.switch_access_shortcut,
                    text: 'Switch Active Month',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                    },
                  ),
                  Container(
                    height: 35,
                    width: 100,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          side: BorderSide(
                            color: CustomColors.appColor,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.appColor),
                        ),
                        onPressed: () {
                          Provider.of<MealProvider>(context, listen: false)
                              .setLogInStatus(false);
                          Navigator.of(context)
                              .pushReplacementNamed(LogInPage.routeName);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<RegisterModel?> getData(BuildContext context) async {
    model = await Provider.of<DBProvider>(context, listen: false)
        .getLogInPersonByManagerId(context) as RegisterModel;
    return model;
  }
}
