import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shop_practice/provider/showCart.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ShowOrderScreen extends StatelessWidget {
  const ShowOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvide = Provider.of<ShowCartProvider>(context);
    cartProvide.fetchData();
    var formatPatter = NumberFormat('###,###');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'خرید ها',
            style: kAppBarTitle,
          ),
        ),
        body: cartProvide.item.isNotEmpty ?
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cartProvide.item.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: ExpansionTile(
                iconColor: Theme.of(context).focusColor,
                collapsedIconColor: Theme.of(context).focusColor,
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'مجموع خرید شما',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        formatPatter
                            .format(cartProvide.item[index].total_price),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'مجموع تخفیف شما',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              formatPatter.format(
                                  cartProvide.item[index].total_off_price),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'bold',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(color: Theme.of(context).focusColor,),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'محصولات',
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontFamily: 'bold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'تعداد',
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontFamily: 'bold',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Image.network(
                      //   cartProvide.item[index].image
                      //       .replaceAll("(", "")
                      //       .replaceAll(")", "")
                      //       .replaceAll("[", "")
                      //       .replaceAll(",", "\n")
                      //
                      //       .replaceAll("]", "").characters.string,
                      //   width: 100,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cartProvide.item[index].title
                                  .replaceAll("(", "")
                                  .replaceAll(")", "")
                                  .replaceAll("[", "")
                                  .replaceAll(",", "\n")
                                  .replaceAll("]", ""),
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              cartProvide.item[index].tedad
                                  .replaceAll("(", "")
                                  .replaceAll(")", "x")
                                  .replaceAll("[", "")
                                  .replaceAll(",", "x\n")
                                  .replaceAll("]", "x"),
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ):Center(
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
                'خریدی انجام نشده',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
