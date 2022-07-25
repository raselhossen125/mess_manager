import 'package:flutter/material.dart';

import '../untils/custom_colors.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const routeName = '/forget-password';
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text('Forgot Your Password?'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Forget Password? Recover Now',
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
                    labelText: "Manager's Registered Email",
                    labelStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(Icons.email_outlined),
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.appColor,
                    ),
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Get Recover Password Link',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
