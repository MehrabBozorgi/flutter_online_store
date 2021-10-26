import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: SpinKitFadingFour(
          color: Theme.of(context).primaryColor,
          size: 60,
          shape: BoxShape.circle,

        ),
      ),
    );
  }
}
