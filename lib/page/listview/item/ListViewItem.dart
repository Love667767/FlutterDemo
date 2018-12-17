import 'package:flutter/material.dart';

/**
 * Item
 */
class ListViewItem extends StatelessWidget {
  final String data;

  const ListViewItem(this.data);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xffe1e1e1)),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Text(data,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Color(0xffff0000)))),
    );
  }
}