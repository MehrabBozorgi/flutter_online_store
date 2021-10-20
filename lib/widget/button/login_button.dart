import 'package:flutter/material.dart';

import '../kConst.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const LoginButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 290, height: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          primary: Color(0xFFB388FF),
          elevation: 10,
        ),
        child: Text(text, style: kLoginButton),
        onPressed: () {
          onTap();
        },
      ),
    );
  }
}
