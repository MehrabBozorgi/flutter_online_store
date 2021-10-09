import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_shop_practice/database/db_helper_cart.dart';
import 'package:flutter_shop_practice/database/db_helper_favorite.dart';
import 'package:flutter_shop_practice/provider/cart.dart';
import 'package:flutter_shop_practice/provider/favorite.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:flutter_shop_practice/widget/detail_screen/DetailScreen_PriceItem.dart';
import 'package:flutter_shop_practice/widget/detail_screen/DetailScreen_TabVIewItem.dart';
import 'package:flutter_shop_practice/widget/spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProductScreen extends StatefulWidget {
  static const routName = 'product_detailScreen';

  final ProductItem productItem;

  const DetailProductScreen({required this.productItem});

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int _currentValue = 1;
  bool _visibility = true;

  //متد لازمه برای اشتراک گذاری محصول
  Future<void> _share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  //متد لازمه برای باز کردن مرورگر
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.productItem.image.isNotEmpty)
        ? Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: DetailScreen_Toolbar(
                    icon: Icons.arrow_back,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  actions: [
                    // افزودن محصول به لیست مورد علاقه با sql
                    Consumer<FavoriteProvider>(
                      builder: (context, favoriteProvider, child) => IconButton(
                        icon: Icon(Icons.bookmark_border_rounded),
                        onPressed: () {
                          favoriteProvider.addProduct(
                            widget.productItem.id.toString(),
                            widget.productItem.size,
                            widget.productItem.title,
                            widget.productItem.image,
                            widget.productItem.befor_price,
                            widget.productItem.after_price,
                            widget.productItem.description,
                            widget.productItem.year,
                            widget.productItem.kid_age,
                            widget.productItem.tedad,
                          );
                          snackBarAddFavorite();
                        },
                      ),
                    ),
                    //
                    //اشتراک گذاری محصول
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      onPressed: _share,
                    ),
                  ],
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15,
                        shadowColor: Colors.black,
                        color: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: widget.productItem.image.isNotEmpty
                              ? Image.network(
                                  widget.productItem.image,
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.contain,
                                )
                              : Image.asset(
                                  'play.png',
                                  width: 190,
                                  height: 230,
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                //بدنه
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        width: double.infinity,
                        decoration: bodyContainerStyle(),
                        child: Column(
                          children: [
                            //نام محصول و دکمه مشاهده سایت
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              margin: EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.productItem.title,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.info_outline_rounded),
                                    onPressed: () {
                                      _launchInBrowser(
                                        'https://par30games.net/',
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            //
                            //حجم بازی
                            MoreInfo(
                              textTitle: 'حجم مورد نیاز : ',
                              textValue:
                                  widget.productItem.size.toString() + ' GB',
                            ),
                            Divder_Widget(),
                            //
                            //محدوده بازی
                            MoreInfo(
                              textTitle: 'محدوده سنی : ',
                              textValue: '+ ' + widget.productItem.kid_age,
                            ),
                            Divder_Widget(),
                            //
                            //سال ساخت بازی
                            MoreInfo(
                              textTitle: 'سال ساخت : ',
                              textValue: widget.productItem.year.toString(),
                            ),
                            //
                            Divder_Widget(),
                            //
                            // بخش تصاویر و نظرات و توضیحات
                            DetailScreen_TabViewtem(
                              productItem: widget.productItem,
                            ),
                            //
                            //بخش نشون دادن محصولات
                            DetailScreen_PriceItem(
                              productItem: widget.productItem,
                            ),
                            //
                            // دکمه اضافه کردن محصول به سبد خرید
                            //بعد از کلیک کردن روی دکمه بخش تعداد محصول نمایش داده میشه
                            Visibility(
                              replacement: Container(
                                width: 200,
                                height: 40,
                                // padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).buttonColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //اضافه محصول به سبد خرید
                                    Consumer<CartProvider>(
                                      builder: (context, cartProvider, child) =>
                                          ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).buttonColor,
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          'ثبت',
                                          style: TextStyle(
                                            fontFamily: 'bold',
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        onPressed: () {
                                          cartProvider.addProductToCart(
                                            widget.productItem.id!.toString(),
                                            widget.productItem.title,
                                            widget.productItem.image,
                                            widget.productItem.befor_price,
                                            widget.productItem.after_price,
                                            _currentValue,
                                          );
                                          // پیغامی که بعد از اضافه کردن نشون داده میشه
                                          snackBarAddCart();
                                        },
                                      ),
                                    ),

                                    //
                                    Row(
                                      children: [
                                        if (_currentValue >= 3)
                                          endAddButton()
                                        else
                                          startAddButton(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            '$_currentValue',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          ),
                                        ),
                                        if (_currentValue <= 1)
                                          startRemoveButton()
                                        else
                                          endRemoveButton(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //
                              visible: _visibility,
                              child: ConstrainedBox(
                                constraints: BoxConstraints.expand(
                                    width: 200, height: 45),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    primary: Theme.of(context).buttonColor,
                                    elevation: 10,
                                  ),
                                  child: Text(
                                    'اضافه کردن به سبد خرید',
                                    style: TextStyle(
                                      color: Theme.of(context).focusColor,
                                      fontFamily: 'light',
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _visibility = false;
                                    });
                                  },
                                ),
                              ),
                            ),

                            SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : SpinKitWidget();
  }

  Widget startAddButton() {
    return IconButton(
      icon: Icon(
        Icons.add,
      ),
      onPressed: () {
        setState(() {
          _currentValue++;
        });
      },
    );
  }

  Widget endAddButton() {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: Colors.grey,
      ),
      onPressed: null,
    );
  }

  Widget startRemoveButton() {
    return IconButton(
      icon: Icon(
        Icons.remove,
        color: Colors.grey,
      ),
      onPressed: null,
    );
  }

  Widget endRemoveButton() {
    return IconButton(
      icon: Icon(
        Icons.remove,
      ),
      onPressed: () {
        setState(() {
          _currentValue--;
        });
      },
    );
  }

  snackBarAddFavorite() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "محصول به لیست علایق افزوده شد",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'light',
            fontSize: 14,
          ),
        ),
        action: SnackBarAction(
          label: 'حذف',
          onPressed: () {
            DBHelperFavorite.delete(
              widget.productItem.id!.toString(),
            );
          },
        ),
      ),
    );
  }

  snackBarAddCart() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "محصول به سبد خرید افزوده شد",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'light',
            fontSize: 14,
          ),
        ),
        action: SnackBarAction(
          label: 'حذف',
          onPressed: () {
            DBHelperCart.delete(
              widget.productItem.id!.toString(),
            );
          },
        ),
      ),
    );
  }

  bodyContainerStyle() {
    return BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
    );
  }
}

class Divder_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).focusColor,
      indent: 30,
      endIndent: 30,
    );
  }
}

class MoreInfo extends StatelessWidget {
  final String textTitle;
  final String textValue;

  const MoreInfo({required this.textTitle, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textTitle,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            textValue,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

class DetailScreen_Toolbar extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  const DetailScreen_Toolbar({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Theme.of(context).focusColor,
          size: 20,
        ),
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}
