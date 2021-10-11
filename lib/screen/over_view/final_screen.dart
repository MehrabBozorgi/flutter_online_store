import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/User.dart';
import 'package:flutter_shop_practice/provider/cart.dart';
import 'package:flutter_shop_practice/provider/order.dart';
import 'package:flutter_shop_practice/screen/over_view/order_screen.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FinalScreen extends StatelessWidget {
  final double totalPrice;
  final double totalOffPrice;
  final List<CartItem> cart;

  FinalScreen({
    required this.totalPrice,
    required this.totalOffPrice,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    int _fav = 0;
    var formatPatter = NumberFormat('###,###');
    final userProvider = Provider.of<UserProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    userProvider.fetchData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'آدرس و زمان ارسال',
            style: kAppBarTitle,
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: userProvider.item.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    UserInfoItem(userProvider: userProvider, index: index),
              ),
            ),
            Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'هزینه ارسال',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 75,
                          child: Text(
                            ' وابسته به زمان ارسال',
                            style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontFamily: 'light',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            child: Baze_Zamani(cart: cart, fav: _fav),
                          ),
                        );
                      },
                      child: Text(
                        'انتخواب زمان ارسال >',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'bold',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.all(5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'قیمت کالا ها :',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          children: [
                            Text(
                              formatPatter.format(totalPrice),
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontFamily: 'bold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '  تومان',
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontFamily: 'light',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Theme.of(context).focusColor,
                        indent: 1,
                        height: 5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تخفیف کالاها :',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          children: [
                            Text(
                              formatPatter.format(totalOffPrice),
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
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Theme.of(context).focusColor,
                        indent: 1,
                        height: 5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'هزینه پستی :',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Row(
                          children: [
                            Text(
                              formatPatter.format(15000),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'bold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '  تومان',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'light',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  color: Theme.of(context).cardColor,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
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
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'آیا مطمئن هستید ؟',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  content: Text(
                                    'سفارش شما در حال ثبت نهایی می باشد',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        'خیر',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        'بله',
                                        style: TextStyle(
                                          color: Colors.red[600],
                                          fontFamily: 'bold',
                                          fontSize: 14,
                                        ),
                                      ),
                                      onPressed: () {
                                        cartProvider.sendProductToServer(
                                          cartProvider.item.map((e) => e.title).toList(),
                                          cartProvider.item.map((e) => e.tedad).toList(),
                                          cartProvider.item.map((e) => e.image).toList(),
                                          totalPrice,
                                          totalOffPrice,
                                        );
                                        print(cartProvider.item.map((e) => e.tedad).toList());
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => OrderScreen(
                                             cart: cartProvider.item,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'مجموع',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'bold',
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    formatPatter.format(totalPrice + 15000),
                                    style: TextStyle(
                                      color: Theme.of(context).focusColor,
                                      fontFamily: 'bold',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ' تومان',
                                    style: TextStyle(
                                      color: Theme.of(context).focusColor,
                                      fontFamily: 'light',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({required this.userProvider, required this.index});

  final UserProvider userProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "ادرس تحویل گیرنده : ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    userProvider.item[index].address,
                    style: TextStyle(
                      fontFamily: 'bold',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'نام تحویل گیرنده : ',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    userProvider.item[index].name,
                    style: TextStyle(
                      fontFamily: 'bold',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "شماره همراه تحویل گیرنده : ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    userProvider.item[index].phone,
                    style: TextStyle(
                      fontFamily: 'bold',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Baze_Zamani extends StatelessWidget {
  const Baze_Zamani({required this.cart, required int fav}) : _fav = fav;

  final List<CartItem> cart;
  final int _fav;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      height: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'انتخواب بازه ی زمانی',
              style: TextStyle(
                fontFamily: 'bold',
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Row(
                children: [
                  Icon(
                    Icons.directions_car_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                  Text(
                    'ارسال پستی',
                    style: TextStyle(
                      fontFamily: 'bold',
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Text('${cart.length} عدد کالا'),
              SizedBox(height: 15),
            ],
          ),
          Divider(
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DefaultTabController(
              length: 5,
              child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: TabBar(
                  isScrollable: true,
                  labelStyle: TextStyle(
                    fontFamily: 'bold',
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Baze_Zamani_tabItem(day: 'شنبه', date: '25'),
                    Baze_Zamani_tabItem(day: 'یک شنبه', date: '26'),
                    Baze_Zamani_tabItem(day: 'دو شنبه', date: '27'),
                    Baze_Zamani_tabItem(day: 'سه شنبه', date: '28'),
                    Baze_Zamani_tabItem(day: 'چهار شنبه', date: '29'),
                  ],
                ),
                body: TabBarView(
                  children: [
                    FinalScreen_TabViewItem(fav: _fav),
                    FinalScreen_TabViewItem(fav: _fav),
                    FinalScreen_TabViewItem(fav: _fav),
                    FinalScreen_TabViewItem(fav: _fav),
                    FinalScreen_TabViewItem(fav: _fav),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Divider(
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
        ],
      ),
    );
  }
}

class FinalScreen_TabViewItem extends StatelessWidget {
  const FinalScreen_TabViewItem({required int fav}) : _fav = fav;

  final int _fav;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio(
                  groupValue: _fav,
                  onChanged: (value) {},
                  value: 'شنبه',
                ),
                Text(
                  'بازه زمانی 9 تا 22 ',
                  style: TextStyle(
                    fontFamily: 'bold',
                    color: Theme.of(context).focusColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '25 هزار تومان',
                style: TextStyle(
                  fontFamily: 'bold',
                  color: Theme.of(context).focusColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Baze_Zamani_tabItem extends StatelessWidget {
  final String day;
  final String date;

  const Baze_Zamani_tabItem({required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        Text(date),
      ],
    );
  }
}
