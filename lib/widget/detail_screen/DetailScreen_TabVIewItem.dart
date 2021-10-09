import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:flutter_shop_practice/screen/over_view/comment_screen.dart';
import 'package:flutter_shop_practice/screen/over_view/description_screen.dart';
import 'package:flutter_shop_practice/screen/over_view/images_screen.dart';


class DetailScreen_TabViewtem extends StatelessWidget {
  const DetailScreen_TabViewtem({required this.productItem});

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 320,
      width: double.infinity,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(

            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            labelStyle: Theme.of(context).textTheme.headline3,
            labelColor: Theme.of(context).buttonColor,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelStyle: Theme.of(context).textTheme.headline4,
            unselectedLabelColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(
                text: 'تصاویر',
              ),
              Tab(
                text: 'نظرات',
              ),
              Tab(
                text: 'توضیحات',
              ),
            ],
          ),
          body: TabBarView(
            children: [
              ImagesScreen(
                id: productItem.id!,
              ),
              CommentScreen(id: productItem.id!),
              DescriptionScreen(
                productItem.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}