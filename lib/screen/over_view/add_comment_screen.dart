import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/comment.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:provider/provider.dart';

class AddCommentScreen extends StatefulWidget {
  int id;
  final String name;
  final String email;
  final String token;

  AddCommentScreen({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  String content = '';
  int fav = 0;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _key,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                ),
                child: Text(
                  'ثبت دیدگاه در مورد محصول',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin:
                    EdgeInsets.only(top: 50, bottom: 25, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  minLines: 4,
                  maxLines: 6,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    errorStyle: errorStyleAddAds,
                    border: InputBorder.none,
                    counterText: '',
                    hintText: 'دیدگاه شما',
                    hintStyle: Theme.of(context).textTheme.headline2,
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                  onSaved: (value) {
                    content = value!;
                  },
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'دیدگاه خالی می باشد';
                    }
                    if (value.trim().length <= 5) {
                      return 'تعداد حروف کافی نمی باشد';
                    }
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'رضایت از کالا ؟',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text('راضی بودم'),
                      Radio(
                        value: 1,
                        activeColor: Theme.of(context).primaryColor,
                        splashRadius: 20,
                        groupValue: fav,
                        onChanged: (int? value) {
                          setState(() {
                            fav = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Text('راضی نبودم'),
                      Radio(
                        value: 0,
                        groupValue: fav,
                        splashRadius: 20,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (int? value) {
                          setState(() {
                            fav = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 35),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 200, height: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    primary: Theme.of(context).primaryColor,
                    elevation: 10,
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();

                      Provider.of<CommentProvider>(context, listen: false)
                          .addComment(
                        widget.token,
                        widget.name,
                        widget.email,
                        content,
                        fav,
                        widget.id,
                      );
                      _key.currentState!.reset();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'ثبت دیدگاه',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'bold',
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
