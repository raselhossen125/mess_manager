// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_cast, must_be_immutable, unused_local_variable, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mess_manager/models/register_model.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/providers/db_provider.dart';
import 'package:mess_manager/untils/custom_colors.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile-page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  RegisterModel? model;
  String? imagePath;
  ImageSource imageSource = ImageSource.camera;
  var ValueController = TextEditingController();

  @override
  void dispose() {
    ValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: getData(context),
          builder: (context, snapshort) {
            if (snapshort.hasData) {
              return Text(model!.managerName + ' Info');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                          ? Stack(
                              children: [
                                Image.asset(
                                  'images/R.png',
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: CustomColors.appColor,
                                    child: IconButton(
                                      onPressed: () {
                                        showConfirmationDialogImageUrl(
                                          context,
                                          'Edit Manager Image',
                                          model!.managerImageUrl,
                                          tableRegisterColImageUrl,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Stack(
                              children: [
                                Image.file(
                                  File(model!.managerImageUrl.toString()),
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: CustomColors.appColor,
                                    child: IconButton(
                                      onPressed: () {
                                        showConfirmationDialogImageUrl(
                                          context,
                                          'Edit Manager Image',
                                          model!.managerImageUrl,
                                          tableRegisterColImageUrl,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                    }
                    return CircularProgressIndicator(
                      color: Colors.white,
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
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
                              onPressed: () {
                                showConfirmationDialog(
                                    Icons.person,
                                    context,
                                    'Edit Manager Name',
                                    model!.managerName,
                                    tableRegisterColName);
                              },
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
                              onPressed: () {
                                showConfirmationDialog(
                                  Icons.email,
                                  context,
                                  'Edit Manager Email',
                                  model!.managerEmail,
                                  tableRegisterColEmail,
                                );
                              },
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
                              onPressed: () {
                                showConfirmationDialog(
                                  Icons.phone,
                                  context,
                                  'Edit Manager Phone',
                                  model!.managerphone,
                                  tableRegisterColPhone,
                                );
                              },
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
                              onPressed: () {
                                showConfirmationDialog(
                                  Icons.school,
                                  context,
                                  'Edit Manager University',
                                  model!.manageruniversity,
                                  tableRegisterColUniversity,
                                );
                              },
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
      ),
    );
  }

  Future<RegisterModel?> getData(BuildContext context) async {
    model = await Provider.of<DBProvider>(context, listen: false)
        .getLogInPersonByManagerId(context) as RegisterModel;
    return model;
  }

  void showConfirmationDialog(
    IconData icon,
    BuildContext context,
    String title,
    value,
    columnName,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextFormField(
          // controller: ValueController,
          cursorColor: CustomColors.appColor,
          keyboardType: TextInputType.emailAddress,
          initialValue: value,
          style: TextStyle(
              color: CustomColors.appColor, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
            contentPadding: EdgeInsets.only(left: 10),
            focusColor: Colors.white,
            prefixIcon: Icon(
              icon,
              color: CustomColors.appColor,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No')),
          TextButton(
            onPressed: () async {
              Provider.of<DBProvider>(context, listen: false)
                  .updateManagerInformation(
                      context, columnName, ValueController.text);
              Navigator.of(context).pushNamed(HomePage.routeName);
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

  void showConfirmationDialogImageUrl(
    BuildContext context,
    String title,
    value,
    columnName,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: value == null
                  ? Image.asset(
                      'images/R.png',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(value),
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      imageSource = ImageSource.camera;
                      getImage();
                    },
                    child: const Text('Camera')),
                SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      imageSource = ImageSource.gallery;
                      getImage();
                    },
                    child: const Text('Gallery')),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No')),
          TextButton(
            onPressed: () async {
              Provider.of<DBProvider>(context, listen: false)
                  .updateManagerInformation(
                      context, columnName, imagePath.toString());
              Navigator.of(context).pushNamed(HomePage.routeName);
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

  void getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: imageSource);
    if (selectedImage != null) {
      setState(() {
        imagePath = selectedImage.path;
      });
    }
  }
}
