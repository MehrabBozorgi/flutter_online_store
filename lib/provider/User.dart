import 'dart:convert';
import 'package:flutter_shop_practice/appData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserItem {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String address;
  final String token;

  UserItem({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    required this.token,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) {
    return UserItem(
      id: int.parse(json['id']),
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      address: json['address'],
      token: json['token'],
    );
  }
}

class UserProvider with ChangeNotifier {
  String url = '${AppData.url}user.php';
  List<UserItem> _item = [];

  List<UserItem> get item => _item;

  Future<void> fetchData() async {
    if (item.length == 0) {
      await http.get(Uri.parse(url)).then(
        (response) {
          if (response.statusCode == 200) {
            List data = jsonDecode(utf8.decode(response.bodyBytes));
            List<UserItem> loaded = [];
            for (int i = 0; i < data.length; i++) {
              var result = UserItem.fromJson(data[i]);
              loaded.add(result);
            }
            _item = loaded;
            notifyListeners();
          }
        },
      );
    }
  }

  bool? _checkValue = false;

  bool? get checkValue => _checkValue;

  bool? getValue() {
    _checkValue = !_checkValue!;
    notifyListeners();
  }
}
