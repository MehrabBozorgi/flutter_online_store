import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData CustomLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Color(0xFFf5effc),
  primaryColor: Color(0xFF6A3899),
  buttonColor: Colors.amberAccent,
  accentColor: Colors.white24,
  focusColor: Colors.black,
  cardColor: Colors.white,
  splashColor: Color(0xFF6A3899),
  disabledColor: Colors.white60,
  canvasColor: Colors.transparent,
  //
  textTheme: TextTheme(
    bodyText1:
        TextStyle(color: Colors.black, fontFamily: 'light', fontSize: 14),
    //
    bodyText2:
        TextStyle( fontFamily: 'light', color: Colors.black,fontSize: 12,),
    //
    headline1: TextStyle( fontFamily: 'bold', color: Colors.black,fontSize: 16,),
    //
    headline2:
        TextStyle(color: Colors.grey[700], fontFamily: 'bold', fontSize: 12,),
    //
    headline3:
        TextStyle(color: Colors.amberAccent, fontFamily: 'bold', fontSize: 16,),
    //
    headline4:
        TextStyle(color: Color(0xFF6A3899), fontFamily: 'light', fontSize: 14,),
    //
    headline5:
    TextStyle(color: Colors.orange, fontFamily: 'bold', fontSize: 12,),
    //
    headline6:
    TextStyle(color: Colors.green[600], fontFamily: 'bold', fontSize: 12,),


  ),
//0xFF122333
//0xFF2EAC68
);
ThemeData Customdark = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0xFF122333),
  primaryColor: Color(0xFF2EAC68),
  buttonColor: Color(0xFFfee715),
  accentColor: Colors.black26,
  focusColor: Colors.white,
  cardColor: Colors.black,
  splashColor: Color(0xFF2EAC68),
  disabledColor: Colors.black87,
  canvasColor: Colors.transparent,
  //
  textTheme: TextTheme(
    bodyText1:
        TextStyle(color: Colors.white, fontFamily: 'light', fontSize: 14,),
    //
    bodyText2:
        TextStyle(fontSize: 12, fontFamily: 'light', color: Colors.white,),
    //
    headline1: TextStyle(fontSize: 16, fontFamily: 'bold', color: Colors.white,),
    //
    headline2:
        TextStyle(color: Colors.grey[400], fontFamily: 'light', fontSize: 12,),
    //
    headline3: TextStyle(
        color: Color(0xFFfee715), fontFamily: 'bold', fontWeight: FontWeight.bold, fontSize: 16,),
    //
    headline4:
        TextStyle(color: Color(0xFF2EAC68), fontFamily: 'light', fontSize: 14,),
    //
    headline5:
    TextStyle(color: Colors.orange, fontFamily: 'bold', fontSize: 12,),
    //
    headline6:
    TextStyle(color: Colors.green[600], fontFamily: 'bold', fontSize: 12,),
  ),
);

class ThemeProvider extends ChangeNotifier {
  SharedPreferences? pref;

  bool? _darkTheme;

  bool? get darkTheme => _darkTheme;

  ThemeProvider() {
    _darkTheme = false;
    _loadedFromPref();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme!;
    _saveToPref();
    notifyListeners();
  }

  _initPref() async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
  }

  _loadedFromPref() async {
    await _initPref();

    _darkTheme = pref!.getBool('theme') ?? false;
    notifyListeners();
  }

  _saveToPref() async {
    await _initPref();
    pref!.setBool('theme', _darkTheme!);
  }
}
