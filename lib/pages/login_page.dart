import 'package:flutter/material.dart';
import 'package:mess_manager/pages/forgetpassword_page.dart';
import 'package:mess_manager/pages/home_page.dart';
import 'package:mess_manager/pages/register_page.dart';

import '../untils/custom_colors.dart';

class LogInPage extends StatelessWidget {
  static const routeName = '/logIn-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: CustomColors.appColor),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset('images/person-icon.png'),
              ),
              const SizedBox(height: 15),
              const Text(
                'Log In As Mess Manager',
                style: TextStyle(
                  color: CustomColors.appColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                cursorColor: CustomColors.appColor,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    labelText: "Enter Manager's Email",
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.9),
                        )
                    )
                ),
                style: const TextStyle(
                  color: CustomColors.appColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: false,
                cursorColor: CustomColors.appColor,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    labelText: "Enter Manager's Password",
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility), onPressed: () {  },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.9),
                        )
                    )
                ),
                style: const TextStyle(
                  color: CustomColors.appColor,
                  fontWeight: FontWeight.w600,
                ),
                validator: (value){
                  if (value == null){
                    return 'password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.appColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ForgetPasswordPage.routeName);
                },
                child: const Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
                ),

              ),
              const SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: CustomColors.appColor,
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterPage.routeName);
                },
                child: const Text(
                  'Not Yet Registered? Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
