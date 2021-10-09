import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:intl/intl.dart';
class DetailScreen_PriceItem extends StatelessWidget {

  const DetailScreen_PriceItem({required this.productItem});

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    var formatPatter =  NumberFormat('###,###');

    return Container(

      margin: EdgeInsets.only(bottom: 25,left: 20,right: 20),
      child: Card(
        elevation: 15,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'قیمت اصلی به تومان',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'قیمت با تخفیف به تومان',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    formatPatter.format(productItem.befor_price),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    formatPatter.format( productItem.after_price),
                    style: Theme.of(context).textTheme.bodyText1,
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