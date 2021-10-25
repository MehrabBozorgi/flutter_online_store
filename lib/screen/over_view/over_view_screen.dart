import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/cart.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:flutter_shop_practice/screen/over_view/cart_screen.dart';
import 'package:flutter_shop_practice/screen/over_view/show_all_product_screen.dart';
import 'package:flutter_shop_practice/widget/cart_screen/badget.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:flutter_shop_practice/widget/over_view/over_view_item.dart';
import 'package:flutter_shop_practice/widget/spinkit.dart';
import 'package:provider/provider.dart';

class OverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final product = productData.item;
    productData.fetchData();
    Future<bool> _willPopCallback() async => false;
    checkConnect() async {
      var connection = await Connectivity().checkConnectivity();
      if (connection == ConnectivityResult.none) {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          title: 'مشکل در اتصال',
          desc: '',
        )..show();
      } else {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.RIGHSLIDE,
          title: 'اینترنت وصل می باشد',
          desc: '',
        )..show();
      }
    }

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'محصولات',
              style: kAppBarTitle,
            ),
            centerTitle: true,
            actions: [
              Consumer<CartProvider>(
                builder: (context, cart, child) => Badge(
                  child: child!,
                  value: cart.itemCount.toString(),
                  color: Colors.red,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: productData.item.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: checkConnect,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  color: Theme.of(context).primaryColor,
                  edgeOffset: 50,
                  displacement: 50,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 15, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'محصولات جدید',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              AllWidget(),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: product.length,
                            padding: EdgeInsets.only(
                                bottom: 15, left: 15, right: 15),
                            itemBuilder: (context, index) =>
                                ChangeNotifierProvider.value(
                              value: product[index],
                              child: OverVewItem(),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 15, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'برای شما',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              AllWidget(),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: product.length,
                            padding: EdgeInsets.only(
                                bottom: 15, left: 10, right: 15),
                            itemBuilder: (context, index) =>
                                ChangeNotifierProvider.value(
                              value: product[index],
                              child: OverVewItem(),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 15, right: 15, left: 10),
                          width: double.infinity,
                          child: Text(
                            'دسته ها',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 15, right: 15, left: 10),
                          width: double.infinity,
                          height: 250,
                          child: ListView.builder(
                            itemCount: cat.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        cat[index].image,
                                        height: 25,
                                        width: 25,
                                      ),
                                      SizedBox(width: 15),
                                      Text(cat[index].title),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).focusColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SpinKitWidget(),
        ),
      ),
    );
  }
}

class AllWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ShowAllProductScreen(),
          ),
        );
      },
      child: Text(
        'مشاهده همه >',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}

List<Cat> cat = [
  Cat(id: 1, title: 'هیجانی', image: 'icon1.png'),
  Cat(id: 2, title: 'ماجراجویانه', image: 'icon2.png'),
  Cat(id: 3, title: 'ترسناک', image: 'icon3.png'),
  Cat(id: 4, title: 'ورزشی', image: 'icon4.png'),
  Cat(id: 5, title: 'متفرقه', image: 'icon5.png'),
];

class Cat {
  final int id;
  final String title;
  final String image;

  Cat({
    required this.id,
    required this.title,
    required this.image,
  });
}
