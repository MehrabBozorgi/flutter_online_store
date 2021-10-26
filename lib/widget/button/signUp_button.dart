import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';

class SignUpButton extends StatelessWidget {

  final String text;
  final Function onTap;

  const SignUpButton({required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 290, height: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          primary: Color(0xFF6A3899),
          elevation: 10,
        ),
        onPressed: (){
          onTap();
        },
        child: Text(text, style: kLoginButton),
      ),
    );
  }
}
