import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  String desc = '';

  DescriptionScreen(String description) {
    this.desc = description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            desc,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
