import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop_practice/appData.dart';
import 'package:http/http.dart' as http;

class ProductItem with ChangeNotifier {
  final int? id;

  final String size;

  final String title;

  final String image;

  final double befor_price;

  final double after_price;

  final String description;

  final String year;

  final String kid_age;
  int tedad;

  ProductItem({
    required this.id,
    required this.size,
    required this.title,
    required this.image,
    required this.befor_price,
    required this.after_price,
    required this.description,
    required this.year,
    required this.kid_age,
    required this.tedad,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: int.parse(json['id']),
        size: json['size'],
        title: json['title'],
        image: json['image'],
        befor_price: double.parse(json['befor_price']),
        after_price: double.parse(json['after_price']),
        description: json['description'],
        year: json['year'],
        kid_age: json['kid_age'],
        tedad: int.parse(json['tedad']),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'size': size,
      'title': title,
      'image': image,
      'befor_price': befor_price,
      'after_price': after_price,
      'description': description,
      'year': year,
      'kid_age': kid_age,
      'tedad': tedad,
    };
  }
}

class ProductProvider with ChangeNotifier {
  String url = '${AppData.url}game.php';
  List<ProductItem> _item = [];

  List<ProductItem> get item => _item;

  Future<void> fetchData() async {
    if (item.length == 0) {
      await http.get(Uri.parse(url)).then(
        (response) {
          if (response.statusCode == 200) {
            List data = jsonDecode(utf8.decode(response.bodyBytes));
            List<ProductItem> loaded = [];
            for (int i = 0; i < data.length; i++) {
              var result = ProductItem.fromJson(data[i]);
              loaded.add(result);
            }
            _item = loaded;
            notifyListeners();
          }
        },
      );
    }
  }
}
