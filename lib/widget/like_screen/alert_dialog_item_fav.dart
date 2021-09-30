import 'package:flutter/material.dart';

class AlertDialogItem_fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      title:
      Text('مطمئن هستید ؟', style: Theme.of(context).textTheme.headline1),
      content: Text(
        'میخواهید محصول را از لیست علایق حذف کنید ؟',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      actions: [
        TextButton(
          child: Text(
            'No',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text(
            'Yes',
            style: TextStyle(
              color: Colors.red[600],
              fontFamily: 'bold',
              fontSize: 14,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}