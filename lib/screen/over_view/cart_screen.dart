import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/database/db_helper_cart.dart';
import 'package:flutter_shop_practice/provider/cart.dart';
import 'package:flutter_shop_practice/provider/order.dart';
import 'package:flutter_shop_practice/screen/over_view/final_screen.dart';
import 'package:flutter_shop_practice/widget/cart_screen/CartScreenItem.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    var formatPatter = NumberFormat('###,###');
    return Scaffold(
      appBar: AppBar(
        actions: [
          (cartProvider.item.isNotEmpty)
              ? IconButton(
                  icon: Icon(Icons.delete_rounded),
                  onPressed: () {
                    DBHelperCart.deleteAll();
                  },
                )
              : Text(''),
        ],
        title: Text(
          'سبد خرید',
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontFamily: 'light',
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body:
      FutureBuilder(
        future:
            Provider.of<CartProvider>(context, listen: false).fetchAndSetCart(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<CartProvider>(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'box.png',
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'سبد خرید خالی است',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
                builder: (context, cart, child) => cart.item.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'محصولات انتخاب شده شما',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: cart.item.length,
                                itemBuilder: (context, index) => CartScreenItem(
                                  cart.item[index].id,
                                  cart.item[index].title,
                                  cart.item[index].tedad,
                                  cart.item[index].befor_price,
                                  cart.item[index].after_price,
                                  cart.item[index].image,
                                ),
                              ),
                            ),
                            //
                            //بخش قیمت ها و محاسبه
                            Card(
                              elevation: 10,
                              margin: EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'قیمت کالا ها :',
                                          style: TextStyle(
                                            color: Theme.of(context).focusColor,
                                            fontFamily: 'bold',
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              formatPatter
                                                  .format(cart.totalPrice),
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .focusColor,
                                                fontFamily: 'bold',
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              '  تومان',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .focusColor,
                                                fontFamily: 'light',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Divider(
                                        color: Theme.of(context).focusColor,
                                        indent: 1,
                                        height: 5,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'تخفیف کالا ها :',
                                          style: TextStyle(
                                            color: Theme.of(context).focusColor,
                                            fontFamily: 'bold',
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              formatPatter
                                                  .format(cart.totalOffPrice),
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'bold',
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              '  تومان',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'light',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Divider(
                                        color: Theme.of(context).focusColor,
                                        indent: 1,
                                        height: 5,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'هزینه پستی بعد از انتخواب محصول محاسبه می شود',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      width: double.infinity,
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor,
                                          elevation: 5,
                                        ),
                                        child: Text(
                                          'اتمام فرایند خرید',
                                          style: TextStyle(
                                            color: Theme.of(context).cardColor,
                                            fontFamily: 'light',
                                            fontSize: 14,
                                          ),
                                        ),
                                        onPressed: () {
                                          orderProvider.addOrder(
                                            cart.item,
                                            cartProvider.totalPrice,
                                            cartProvider.totalOffPrice,
                                          );

                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => FinalScreen(
                                                totalPrice:
                                                    cartProvider.totalPrice,
                                                totalOffPrice:
                                                    cartProvider.totalOffPrice,
                                                cart: cartProvider.item,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'box.png',
                              height: 200,
                              width: 200,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'سبد خرید خالی است',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      ),
              ),
      ),
    );
  }
}
