import 'package:flutter/foundation.dart';
import 'cart.dart';

class OrderItem {
  final String id;
  final double totalPrice;
  final double totalOffPrice;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.totalPrice,
    required this.totalOffPrice,
    required this.products,
    required this.dateTime,
  });
}

class OrderProvider with ChangeNotifier {
  List<OrderItem> _order = [];

  List<OrderItem> get order => _order;

  void addOrder(List<CartItem> cartProducts, double total, double offTotal) {
    _order.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        totalPrice: total,
        totalOffPrice: offTotal,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void clean() {

    _order.clear();
    notifyListeners();
  }
}
