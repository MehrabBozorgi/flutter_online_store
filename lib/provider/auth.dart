import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop_practice/appData.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final signUpUrl = '${AppData.url}signup.php';
  final logInUrl = '${AppData.url}login.php';

  var tokenResult = '';

  AuthProvider() {
    getToken();
  }

  Future signUpRequest(String name, String email, String phone, String password,
      String address) async {
    await http.post(Uri.parse(signUpUrl), body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'address': address,
    });
    notifyListeners();
  }


  Future logInRequest(String? email, String? password) async {
    var response = await http.post(Uri.parse(logInUrl), body: {
      'email': email!,
      'password': password!,
    });
    setToken(jsonDecode(response.body)['token']);
    print(response.body);
    notifyListeners();
  }

  Future setToken(String? token) async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    await pref.setString('token', token!);
  }

  Future getToken() async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    tokenResult = pref.getString('token')!;
    notifyListeners();
  }

  Future<void> exitAccount() async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    notifyListeners();
  }

}
