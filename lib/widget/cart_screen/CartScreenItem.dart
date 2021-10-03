import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/database/db_helper_cart.dart';
import 'package:intl/intl.dart';

class CartScreenItem extends StatelessWidget {
  final String id;
  final double befor_price;
  final double after_price;
  final int tedad;
  final String title;
  final String image;

  CartScreenItem(
    this.id,
    this.title,
    this.tedad,
    this.befor_price,
    this.after_price,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    var formatPatter = new NumberFormat('###,###');

    return Column(
      children: [
        Dismissible(
          key: ValueKey(id),
          confirmDismiss: (value) {
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('مطمئن هستید ؟',
                    style: Theme.of(context).textTheme.headline1),
                content: Text(
                  'میخواهید محصول را از سبد خرید حذف کنید ؟',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'خیر',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
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
                      Navigator.of(context).pop();
                      DBHelperCart.delete(id);
                    },
                  ),
                ],
              ),
            );
          },
          background: Container(
            color: Theme.of(context).errorColor,
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete_forever,
              size: 30,
              color: Colors.white,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 160,
            child: Card(
              elevation: 10,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        image,
                        height: 150,
                        width: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                title,
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  '${(formatPatter.format(
                                    befor_price - after_price,
                                  ))}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'bold',
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  ' تومان  تخفیف',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'light',
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'قیمت واحد : ',
                                      textAlign: TextAlign.right,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    Text(
                                      formatPatter.format(after_price.round()),
                                      textAlign: TextAlign.right,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      ' تومان',
                                      textAlign: TextAlign.right,
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
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      formatPatter.format(after_price * tedad),
                                      textAlign: TextAlign.right,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      '  تومان',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'light',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    '${tedad}x',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
