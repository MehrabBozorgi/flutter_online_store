import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:provider/provider.dart';

import '../spinkit.dart';

class OverViewGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductItem>(context, listen: false);

    return (product.image.isNotEmpty)
        ? ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: FadeInImage.assetNetwork(
            placeholder: 'spin.gif',
            image: '${product.image}',
            fadeInDuration: Duration(milliseconds: 400),
            // width: 20,
            // height: 20,
            fit: BoxFit.cover,
          ),
        )
        : SpinKitWidget();
  }
}
