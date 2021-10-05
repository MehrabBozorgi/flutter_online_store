import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/User.dart';
import 'package:flutter_shop_practice/provider/comment.dart';
import 'package:provider/provider.dart';

import 'add_comment_screen.dart';

class CommentScreen extends StatelessWidget {
  final int id;

  const CommentScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CommentProvider>(context);
    provider.fetchData(id);

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fetchData();

    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
      child: ListView.builder(
        itemCount: provider.item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: 250,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddCommentScreen(
                          email: userProvider.item[index].email,
                          name: userProvider.item[index].name,
                          token: userProvider.item[index].token,
                          id: id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.add_comment_rounded,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                provider.item[index].fav != 1
                    ? CommentFav_NO_Widget(
                        text: 'خرید این محصول رو پیشنهاد نمیکنم',
                      )
                    : CommentFav_YES_Widget(
                        text: 'خرید این محصول رو پیشنهاد میکنم',
                      ),
                Container(
                  width: double.infinity,
                  height: 125,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    provider.item[index].content,
                    maxLines: 4,
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontFamily: 'light',
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        provider.item[index].date,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(width: 5),
                      Text(
                        provider.item[index].name,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentFav_YES_Widget extends StatelessWidget {
  final String text;

  const CommentFav_YES_Widget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.thumb_up_off_alt_outlined,
              size: 18,
              color: Colors.green[600],
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class CommentFav_NO_Widget extends StatelessWidget {
  final String text;

  const CommentFav_NO_Widget({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.thumb_down_off_alt_outlined,
              size: 18,
              color: Colors.orange,
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
