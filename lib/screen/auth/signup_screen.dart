import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/auth.dart';
import 'package:flutter_shop_practice/screen/auth/login_screen.dart';
import 'package:flutter_shop_practice/widget/button/signUp_button.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  String? _name;
  String? _password;
  String? _address;
  String? _phone;
  String? _email;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'ثبت نام',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'bold',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Image.asset(
                    'asset/signups.png',
                    width: MediaQuery.of(context).size.width - 30,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                    decoration: kTextContainerForm,
                    child: TextFormField(
                      maxLength: 20,
                      onSaved: (value) {
                        _name = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'فرم خالی می باشد';
                        }
                        if (value.length <= 3) {
                          return 'اطلاعات وارد شده صحیح نمی باشد';
                        }
                      },
                      cursorColor: Colors.deepPurpleAccent[900],
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: 'نام کاربری',
                        hintStyle: hintStyleLoginScreen,
                        icon: Icon(
                          Icons.person,
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

                        return null;
                      },
                      cursorColor: Colors.deepPurpleAccent[900],
                      keyboardType: TextInputType.emailAddress,
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
                      maxLength: 11,
                      onSaved: (value) {
                        _phone = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'فرم خالی می باشد';
                        }
                        if (value.length <= 10) {
                          return 'شماره وارد شده اشتباه';
                        }
                      },
                      cursorColor: Colors.deepPurpleAccent[900],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: 'شماره همراه',
                        hintStyle: hintStyleLoginScreen,
                        icon: Icon(
                          Icons.phone,
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                    decoration: kTextContainerForm,
                    child: TextFormField(
                      maxLength: 100,
                      onSaved: (value) {
                        _address = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'فرم خالی می باشد';
                        }
                        if (value.length <= 20) {
                          return 'اطلاعات وارد شده صحیح نمی باشد';
                        }
                      },
                      minLines: 3,
                      maxLines: 5,
                      cursorColor: Colors.deepPurpleAccent[900],
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: 'آدرس',
                        hintStyle: hintStyleLoginScreen,
                        icon: Icon(
                          Icons.location_on_rounded,
                          color: Color(0xFF6A3899),
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SignUpButton(
                    text: 'ثبت نام',
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();

                        await provider.signUpRequest(
                          _name!,
                          _email!.trim(),
                          _phone!.trim(),
                          _password!.trim(),
                          _address!,
                        );
                        await provider.logInRequest(
                          _email!.trim(),
                          _password!.trim(),
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ثبت نام کرده اید؟',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'bold',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'ورود به حساب کاربری',
                          style: TextStyle(
                            color: Color(0xFF6A3899),
                            fontFamily: 'bold',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
