import 'package:flutter/foundation.dart';
import 'package:flutter_shop_practice/database/db_helper_cart.dart';
import 'package:http/http.dart' as http;
import '../appData.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final double befor_price;
  final double after_price;
  final int tedad;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.befor_price,
    required this.after_price,
    required this.tedad,
  });

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        befor_price: double.parse(json['befor_price']),
        after_price: double.parse(json['after_price']),
        tedad: int.parse(json['tedad']),
      );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'];
    map['title'];
    map['image'];
    double.parse(map['befor_price']);
    double.parse(map['after_price']);
    int.parse(map['tedad']);
    return map;
  }
}

class CartProvider with ChangeNotifier {
  List<CartItem> _item = [];

  List<CartItem> get item => _item;

  Future<void> fetchAndSetCart() async {
    final dataList = await DBHelperCart.getData('user_cart');
    _item = dataList
        .map(
          (item) => CartItem(
            id: item['id'],
            title: item['title'],
            image: item['image'],
            befor_price: item['befor_price'],
            after_price: item['after_price'],
            tedad: item['tedad'],
          ),
        )
        .toList();
    notifyListeners();
  }

  void addProductToCart(
    String pickId,
    String pickTitle,
    String pickImage,
    double pickBefor_price,
    double pickAfter_price,
    int pickTedad,
  ) {
    final newProduct = CartItem(
      id: pickId,
      title: pickTitle,
      image: pickImage,
      befor_price: pickBefor_price,
      after_price: pickAfter_price,
      tedad: pickTedad,
    );
    _item.add(newProduct);
    DBHelperCart.insert('user_cart', {
      'id': newProduct.id,
      'title': newProduct.title,
      'image': newProduct.image,
      'befor_price': newProduct.befor_price,
      'after_price': newProduct.after_price,
      'tedad': newProduct.tedad,
    });
    notifyListeners();
  }

  int get itemCount {
    return _item.length;
  }

  double get totalPrice {
    var total = 0.0;
    _item.forEach((cartItem) {
      total += cartItem.after_price * cartItem.tedad;
    });
    return total;
  }

  double get totalOffPrice {
    var total = 0.0;
    _item.forEach((cartItem) {
      total += cartItem.tedad * (cartItem.befor_price - cartItem.after_price);
    });
    return total;
  }

  Future<void> sendProductToServer(
    var title,
    var tedad,
    var image,
    var totalPrice,
    var totalOffPrice,
  ) async {
    await http.post(
      Uri.parse('${AppData.url}add_product_to_cart.php'),
      body: {
        'title': '$title',
        'tedad': '$tedad',
        'image': '$image',
        'total_price': '$totalPrice',
        'total_off_price': '$totalOffPrice',
      },
    );
    notifyListeners();
  }
}
