import 'package:flutter/foundation.dart';
import 'package:flutter_shop_practice/database/db_helper_favorite.dart';

class FavoriteItem with ChangeNotifier {
  final String id;
  final String size;
  final String title;
  final String image;
  final double befor_price;
  final double after_price;
  final String description;
  final String year;
  final String kid_age;
  final int tedad;

  FavoriteItem({
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
}

class FavoriteProvider with ChangeNotifier {
  List<FavoriteItem> _item = [];

  List<FavoriteItem> get item => _item;

  void addProduct(
    String pickId,
    String pickSize,
    String pickTitle,
    String pickImage,
    double pickBefor_price,
    double pickAfter_price,
    String pickDescription,
    String pickYear,
    String pickKid_age,
    int pickTedad,
  ) {
    final newProduct = FavoriteItem(
      id: pickId,
      size: pickSize,
      title: pickTitle,
      image: pickImage,
      befor_price: pickBefor_price,
      after_price: pickAfter_price,
      description: pickDescription,
      year: pickYear,
      kid_age: pickKid_age,
      tedad: pickTedad,
    );
    _item.add(newProduct);
    notifyListeners();
    DBHelperFavorite.insert('user_favorite', {
      'id': newProduct.id,
      'title': newProduct.title,
      'size': newProduct.size,
      'image': newProduct.image,
      'befor_price': newProduct.befor_price,
      'after_price': newProduct.after_price,
      'description': newProduct.description,
      'year': newProduct.year,
      'kid_age': newProduct.kid_age,
      'tedad': newProduct.tedad,
    });
  }

  Future<void> fetchAndSetFavorite() async {
    final dataList = await DBHelperFavorite.getData('user_favorite');
    _item = dataList
        .map(
          (item) => FavoriteItem(
            id: item['id'],
            size: item['size'],
            title: item['title'],
            image: item['image'],
            befor_price: item['befor_price'],
            after_price: item['after_price'],
            description: item['description'],
            year: item['year'],
            kid_age: item['kid_age'],
            tedad: item['tedad'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
