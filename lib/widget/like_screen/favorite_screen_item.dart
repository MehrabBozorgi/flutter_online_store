import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/favorite.dart';
import 'package:flutter_shop_practice/provider/product.dart';

class FavoriteScreenItem extends StatelessWidget {
  const FavoriteScreenItem({required this.productsDb,required this.index});

  final List<FavoriteItem> productsDb;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                productsDb[index].image,
                width: 120,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 150,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width - 180,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      productsDb[index].title,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 180,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      productsDb[index].after_price.toString()+',000' + ' تومان',
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width - 180,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          'حجم بازی : ',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          productsDb[index].size.toString() + ' GB',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}