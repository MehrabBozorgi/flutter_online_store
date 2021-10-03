import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_shop_practice/appData.dart';

class CommentItem {
  final int id;
  final int product_id;
  final int fav;
  final String name;
  final String email;
  final String content;
  final String date;

  CommentItem({
    required this.id,
    required this.product_id,
    required this.fav,
    required this.name,
    required this.email,
    required this.content,
    required this.date,
  });

  factory CommentItem.fromJson(Map<String, dynamic> json) {
    return CommentItem(
      id: int.parse(json['id']),
      product_id: int.parse(json['product_id']),
      fav: int.parse(json['fav']),
      name: json['name'],
      email: json['email'],
      content: json['content'],
      date: json['date'],
    );
  }
}

class CommentProvider with ChangeNotifier {
  List<CommentItem> _item = [];

  List<CommentItem> get item => _item;

  Future<void> fetchData(int id) async {
    final response = await http
        .get(Uri.parse('${AppData.url}uniq_comment.php/?id=${id.toString()}'));

    List data = jsonDecode(utf8.decode(response.bodyBytes));
    List<CommentItem> loaded = [];
    for (int i = 0; i < data.length; i++) {
      var result = CommentItem.fromJson(data[i]);
      loaded.add(result);
    }
    _item = loaded;
    notifyListeners();
  }

  Future<void> addComment(
    var token,
    String name,
    String email,
    String content,
    int fav,
    int product_id,
  ) async {
    await http.post(
      Uri.parse('${AppData.url}addcomment.php'),
      headers: {
        'token': '$token',
      },
      body: {
        'name': name,
        'email': email,
        'content': content,
        'fav': ' $fav',
        'product_id': '$product_id',
      },
    );
    notifyListeners();
  }
}
