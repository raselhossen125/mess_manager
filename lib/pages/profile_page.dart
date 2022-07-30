// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_cast, must_be_immutable, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mess_manager/models/register_model.dart';
import 'package:mess_manager/providers/db_provider.dart';
import 'package:mess_manager/untils/custom_colors.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile-page';
  RegisterModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: getData(context),
          builder: (context, snapshort) {
            if (snapshort.hasData) {
              return Text(model!.managerName + 'Info');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: FutureBuilder(
                future: getData(context),
                builder: (context, snapshort) {
                  if (snapshort.hasData) {
                    return model?.managerImageUrl == null
                        ? Image.asset(
                            'images/R.png',
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(model!.managerImageUrl.toString()),
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                  }
                  return CircularProgressIndicator(
                    color: Colors.white,
                  );
                },
              ),
            ),
            SizedBox(height: 3),
            Card(
              elevation: 4,
              child: Column(
                children: [
                  FutureBuilder(
                    future: getData(context),
                    builder: (context, snapShort) {
                      if (snapShort.hasData) {
                        return ListTile(
                          title: Text(model!.managerName),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: CustomColors.appColor,
                            ),
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  Divider(),
                  FutureBuilder(
                    future: getData(context),
                    builder: (context, snapShort) {
                      if (snapShort.hasData) {
                        return ListTile(
                          title: Text(model!.managerEmail),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: CustomColors.appColor,
                            ),
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  Divider(),
                  FutureBuilder(
                    future: getData(context),
                    builder: (context, snapShort) {
                      if (snapShort.hasData) {
                        return ListTile(
                          title: Text(model!.managerphone),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: CustomColors.appColor,
                            ),
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  Divider(),
                  FutureBuilder(
                    future: getData(context),
                    builder: (context, snapShort) {
                      if (snapShort.hasData) {
                        return ListTile(
                          title: Text(model!.manageruniversity),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: CustomColors.appColor,
                            ),
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            )
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
