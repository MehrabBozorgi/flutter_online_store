import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/auth.dart';
import 'package:flutter_shop_practice/screen/auth/signup_screen.dart';
import 'package:flutter_shop_practice/widget/button/signUp_button.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:provider/provider.dart';

import '../main_screen.dart';

class LoginScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  String? _password;
  String? _email;

  @override
  Widget build(BuildContext context) {
    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('An error Occurred'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }

    final provider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'ورود',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'bold',
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Image.asset(
                  'asset/logins.png',
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                  decoration: kTextContainerForm,
                  child: TextFormField(
                    maxLength: 30,
                    onSaved: (value) {
                      _email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'فرم خالی می باشد';
                      }
                      if (value.length <= 6) {
                        return 'اطلاعات وارد شده صحیح نمی باشد';
                      }
                    },
                    cursorColor: Colors.deepPurpleAccent[900],
                    keyboardType: TextInputType.emailAddress,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'ایمیل',
                      hintStyle: hintStyleLoginScreen,
                      icon: Icon(
                        Icons.alternate_email,
                        color: Color(0xFF6A3899),
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                  decoration: kTextContainerForm,
                  child: TextFormField(
                    maxLength: 15,
                    style: Theme.of(context).textTheme.bodyText1,
                    obscureText: true,
                    onSaved: (value) {
                      _password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'فرم خالی می باشد';
                      }

                      if (value.length <= 6) {
                        return 'رمز ورود کوتاه می باشد';
                      }
                    },
                    cursorColor: Colors.deepPurpleAccent[900],
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'رمز عبور',
                      hintStyle: hintStyleLoginScreen,
                      icon: Icon(
                        Icons.lock_rounded,
                        color: Color(0xFF6A3899),
                        size: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SignUpButton(
                  text: 'ورود به حساب کاربری',
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();

                      await provider.logInRequest(_email!, _password!);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ثبت نام نکرده اید؟',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'bold',
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'ثبت نام',
                        style: TextStyle(
                          color: Color(0xFF6A3899),
                          fontFamily: 'bold',
                          fontSize: 12,
                        ),
                      ),
                    ],
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
