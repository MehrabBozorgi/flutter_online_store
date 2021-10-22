import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/database/db_helper_cart.dart';
import 'package:flutter_shop_practice/provider/cart.dart';
import 'package:flutter_shop_practice/provider/order.dart';
import 'package:flutter_shop_practice/screen/main_screen.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:flutter_shop_practice/widget/over_view/OrderItemScreen.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  final List<CartItem> cart;

  OrderScreen({
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    Future<bool> _willPopCallback() async => false;

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Text(''),
            title: Text(
              'خرید شما',
              style: kAppBarTitle,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: orderProvider.order.length,
                    itemBuilder: (context, index) => OrderItemScreen(
                      order: orderProvider.order[index],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 10,
                        primary: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 75, vertical: 12)),
                    child: Text(
                      'بازگشت',
                      style: kLoginButton,
                    ),
                    onPressed: () {
                      DBHelperCart.deleteAll();
                      orderProvider.clean();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
