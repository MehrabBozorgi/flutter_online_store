import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop_practice/appData.dart';
import 'package:http/http.dart' as http;

class ImagesItem {
  final String image_slide;

  ImagesItem({required this.image_slide});

  factory ImagesItem.fromJson(Map<String, dynamic> json) {
    return ImagesItem(
      image_slide: json['image_slide'],
    );
  }
}

class ImagesProvider extends ChangeNotifier {
  List<ImagesItem> _item = [];

  List<ImagesItem> get item => _item;

  Future<void> fetchData(int id) async {
    var response =
        await http.get(Uri.parse('${AppData.url}uniq_images.php/?id=${id}'));

    List data = jsonDecode(utf8.decode(response.bodyBytes));
    List<ImagesItem> loaded = [];
    for (int i = 0; i < data.length; i++) {
      var result = ImagesItem.fromJson(data[i]);
      loaded.add(result);
    }
    _item = loaded;

    notifyListeners();
  }
}
