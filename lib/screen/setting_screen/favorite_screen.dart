import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/database/db_helper_favorite.dart';
import 'package:flutter_shop_practice/provider/favorite.dart';
import 'package:flutter_shop_practice/widget/like_screen/favorite_screen_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'علاقه مندی ها',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'light',
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<FavoriteProvider>(context, listen: false)
            .fetchAndSetFavorite(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<FavoriteProvider>(
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
                        'لیست علایق خالی است',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
                builder: (context, product, child) => product.item.length <= 0
                    ? child!
                    : ListView.builder(
                        itemCount: product.item.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 190,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Dismissible(
                              background: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).errorColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.only(right: 10),
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete_forever,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              key: ValueKey(product.item[index].id),
                              onDismissed: (value) {
                                setState(() {
                                  DBHelperFavorite.delete(
                                      product.item[index].id);
                                });
                              },
                              child: FavoriteScreenItem(
                                productsDb: product.item,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
              ),
      ),
    );
  }
}
