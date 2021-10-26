import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop_practice/appData.dart';
import 'package:http/http.dart' as http;

class ShowCartItem {
  final int id;
  final double total_price;
  final double total_off_price;
  final String date;
  final String title;
  final String tedad;
  final String image;

  ShowCartItem({
    required this.id,
    required this.total_price,
    required this.total_off_price,
    required this.date,
    required this.title,
    required this.tedad,
    required this.image,
  });

  factory ShowCartItem.fromJson(Map<String, dynamic> json) {
    return ShowCartItem(
      id: int.parse(json['id']),
      total_price: double.parse(json['total_price']),
      total_off_price: double.parse(json['total_off_price']),
      date: json['date'],
      title: json['title'],
      tedad: json['tedad'],
      image: json['image'],
    );
  }
}

class ShowCartProvider extends ChangeNotifier {
  List<ShowCartItem> _item = [];

  List<ShowCartItem> get item => _item;

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse('${AppData.url}show_cart.php'));

    List data = jsonDecode(utf8.decode(response.bodyBytes));
    List<ShowCartItem> loaded = [];
    for (int i = 0; i < data.length; i++) {
      var result = ShowCartItem.fromJson(data[i]);
      loaded.add(result);
    }
    _item = loaded;

    notifyListeners();
  }
}
