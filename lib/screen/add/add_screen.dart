import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/User.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:flutter_shop_practice/widget/spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'add_ads_screen.dart';

class AddScreen extends StatelessWidget {
  var _check = false;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
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
    return productData.item.isNotEmpty ? Scaffold(
      appBar: AppBar(
        title: Text('ثبت محصول', style: kAppBarTitle),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: checkConnect,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).primaryColor,
        edgeOffset: 50,
        displacement: 50,
        child: Center(
          child: Column(
            children: [
              Lottie.asset(
                'asset/wait.json',
                repeat: false,
                fit: BoxFit.cover,
                height: 200,
                width: 250,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<UserProvider>(
                    builder: (context, userProvider, child) => Checkbox(
                      value: userProvider.checkValue,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        if (value != _check) {
                          userProvider.getValue();
                          print('yes');
                        } else {
                          userProvider.getValue();
                          _check;
                          print('no');
                        }
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'قوانین را مطالعه کرده اید ؟',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'قوانین ',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              content: ListView.builder(
                                itemCount: roll.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) =>
                                    RuleItem(roll: roll, index: index),
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    'بازگشت',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'bold',
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'قوانین',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'bold',
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Consumer<UserProvider>(
                builder: (BuildContext context, userProvider, Widget? child) =>
                    Visibility(
                  visible: userProvider.checkValue!,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 10,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      label: Text(
                        'اضافه کردن محصول',
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontFamily: 'light',
                          fontSize: 14,
                        ),
                      ),
                      icon: Icon(
                        Icons.add_rounded,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddAdsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ):SpinKitWidget();
  }

  List<RollModel> roll = [
    RollModel(
        title: 'محتوای غیرمجاز',
        subTitle:
            'منظور از محتوا در این قسمت،  تمام متعلقات برنامه شامل پایگاه داده‌، کدهای برنامه (Source Code)، نام بسته، نام و توضیحات‌ برنامه، نام برنامه در بازار، عنوان توسعه‌دهنده، متن و عکس، صدا و فیلم، تبلیغات داخل برنامه، محصولات درون برنامه‌ و... است. همچنین اطلاعات حساب توسعه‌دهنده که برای کاربران نمایش داده می‌شود نیز بخشی از محتوا به شمار می‌آید. پیش از انتشار برنامه از این‌که محتوای آن ناقض قوانين كشور، اخلاق عمومی و قوانین بازار نباشد اطمینان حاصل کنید.'),
    RollModel(
        title: 'محتوای ناقض قوانین',
        subTitle:
            'برنامه‌ها نباید به هیچ شکلی رفتار ناقض قوانین را آموزش یا نمایش دهند یا مروج و مشوق جرم و بی‌قانونی باشند. محتوای ناقض قوانین کشور شامل موارد مندرج در فهرست مصادیق محتوای مجرمانه موضوع ماده ۷۴۹ قانون مجازات بخش تعزیرات است'),
    RollModel(
        title: 'محتوای خشونت‌آمیز',
        subTitle:
            'امکان انتشار هر گونه محتوای خشونت‌آمیز علیه انسان‌ها یا حیوانات که نقص عضو، آسیب‌دیدگی، آثار شکنجه و صدمه‌دیدگی را نمایش می‌دهد و یا تشویق به صدمه زدن، آزار و اذیت دیگران و رفتار خشونت‌آمیز می‌کند در بازار وجود ندارد'),
  ];
}

class RuleItem extends StatelessWidget {
  final int index;
  final List<RollModel> roll;

  const RuleItem({required this.index, required this.roll});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5, top: 15),
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Text(
            roll[index].title,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Text(
            roll[index].subTitle,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}

class RollModel {
  final String title;
  final String subTitle;

  RollModel({required this.title, required this.subTitle});
}
