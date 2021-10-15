import 'package:flutter/material.dart';

final fTextFormStyle = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFFB388FF), width: 2),
  borderRadius: BorderRadius.circular(15),
);
final kTextContainerForm = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.deepPurple[100],
);

final kAppBarTitle = TextStyle(
  color: Colors.white,
  fontFamily: 'light',
  fontSize: 16,
);
final kLoginButton = TextStyle(
  color: Colors.white,
  fontFamily: 'light',
  fontSize: 16,
);
final kBuyButton = TextStyle(
  color: Colors.black,
  fontFamily: 'bold',
  fontSize: 12,
);
final hintStyleAddAds = TextStyle(
  color: Colors.grey[600],
  fontFamily: 'light',
  fontSize: 12,
);
final hintStyleLoginScreen = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontFamily: 'light',
);
final errorStyleAddAds = TextStyle(
  color: Colors.red,
  fontFamily: 'bold',
  fontSize: 12,
);
final errorBorderAddAds = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(color: Colors.red, width: 1,),
);
final styleBorderAddAds = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide.none,
);
