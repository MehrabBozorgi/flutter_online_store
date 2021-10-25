import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/auth.dart';
import 'package:flutter_shop_practice/provider/theme.dart';
import 'package:flutter_shop_practice/screen/over_view/detai_product_screen.dart';
import 'package:flutter_shop_practice/screen/setting_screen/show_order_screen.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:provider/provider.dart';

import 'favorite_screen.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context,listen: false);
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
    return RefreshIndicator(
      onRefresh: checkConnect,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      color: Theme.of(context).primaryColor,
      edgeOffset: 50,
      displacement: 50,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'تنظیمات',
            style: kAppBarTitle,
          ),
        ),
        body: Column(
          children: [
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => SwitchListTile(
                activeColor: Theme.of(context).primaryColor,
                value: themeProvider.darkTheme!,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
                title: Text(
                  'تغیر ظاهر',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  Divder_Widget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border_rounded),
                        SizedBox(width: 5),
                        Text(
                          'علاقمندی ها',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShowOrderScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  Divder_Widget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_basket_outlined),
                        SizedBox(width: 5),
                        Text(
                          'خریداری شده ها',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Divder_Widget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
