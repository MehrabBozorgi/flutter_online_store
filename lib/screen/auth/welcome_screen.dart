import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/screen/auth/signup_screen.dart';
import 'package:flutter_shop_practice/widget/button/login_button.dart';
import 'package:flutter_shop_practice/widget/button/signUp_button.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'welcome.png',
                width: MediaQuery.of(context).size.width - 30,
                height: 250,
              ),
              SizedBox(height: 30),
              SignUpButton(
                text: 'ثبت نام',
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              LoginButton(
                text: 'ورود به حساب کاربری',
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
