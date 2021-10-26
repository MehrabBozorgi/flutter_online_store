import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/auth.dart';
import 'package:flutter_shop_practice/screen/auth/welcome_screen.dart';
import 'package:flutter_shop_practice/screen/main_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routName = 'splashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? _opacityAnim;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _opacityAnim = Tween<double>(begin: 0, end: 1).animate(controller!);
    controller!.forward();
    checkLogin();
  }

  checkLogin() {
    final token = Provider.of<AuthProvider>(context, listen: false);
    _opacityAnim!.addStatusListener((status) async {
      if (status == AnimationStatus.completed && token.tokenResult.isNotEmpty) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
        });
      } else {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: AnimatedBuilder(
            animation: controller!,
            builder: (context, _) {
              return Opacity(
                opacity: _opacityAnim!.value,
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    Lottie.asset(
                      'asset/splash.json',
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    ),
                    Text(
                      'Mehrab Bozorgi',
                      style: TextStyle(
                        color: Color(0xFF494f56),
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Game Store',
                      style: TextStyle(
                        color: Color(0xff7a848e),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
}
