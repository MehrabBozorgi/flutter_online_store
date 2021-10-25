import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/cart.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:flutter_shop_practice/screen/over_view/detai_product_screen.dart';
import 'package:flutter_shop_practice/widget/spinkit.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../kConst.dart';

class OverVewItem extends StatelessWidget {
  var formatPatter = NumberFormat('###,###');

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductItem>(context, listen: false);
    var cartProvider = Provider.of<CartProvider>(context, listen: false);

    return (product.title.isNotEmpty && product.image.isNotEmpty)
        ? Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            shadowColor: Theme.of(context).primaryColor,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => DetailProductScreen(productItem: product),
                  ),
                );
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: product.image != null
                        ? FadeInImage.assetNetwork(
                            placeholder: 'spin.gif',
                            image: '${product.image}',
                            fadeInDuration: Duration(milliseconds: 400),
                            width: 120,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'camera.png',
                            width: 120,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 120,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              product.title,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formatPatter.format(product.befor_price) +
                                    ' ' +
                                    'تومان',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontFamily: 'bold',
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                formatPatter.format(product.after_price) +
                                    ' ' +
                                    'تومان',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).buttonColor,
                                  fontFamily: 'bold',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          // ConstrainedBox(
                          //   constraints:
                          //       BoxConstraints.tightFor(width: 70, height: 25),
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       primary: Theme.of(context).buttonColor,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //     ),
                          //     child: Text(
                          //       'خرید',
                          //       style: kBuyButton,
                          //     ),
                          //     onPressed: () {
                          //       cartProvider.addProductToCart(
                          //         product.id!.toString(),
                          //         product.title,
                          //         product.image,
                          //         product.befor_price,
                          //         product.after_price,
                          //         product.tedad,
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SpinKitWidget();
  }
}
