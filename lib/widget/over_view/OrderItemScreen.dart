import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/order.dart';
import 'package:intl/intl.dart';

class OrderItemScreen extends StatefulWidget {
  final OrderItem order;

  const OrderItemScreen({required this.order});

  @override
  _OrderItemScreenState createState() => _OrderItemScreenState();
}

class _OrderItemScreenState extends State<OrderItemScreen> {
  var _expanded = false;
  var formatPatter = NumberFormat('###,###');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '${formatPatter.format(widget.order.totalPrice+15000)}تومان ',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              DateFormat('yyyy/MM/dd hh:mm').format(widget.order.dateTime),
              style: Theme.of(context).textTheme.headline2,
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: min(
                widget.order.products.length * 50 + 15,
                175,
              ),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              prod.image,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(prod.title,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.bodyText1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${formatPatter.format(prod.after_price)}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    '${prod.tedad}x',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).focusColor,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
