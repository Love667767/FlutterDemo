import 'package:flutter/material.dart';

class WidgetListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget List"),
      ),

      // 适用于Item数量不多的时候
      body: ListView(
        controller: ScrollController(),
        children: <Widget>[
          ListTile(title: Text("ListView"), onTap: () => {

          }),
          const ListTile(title: Text("B")),
          const ListTile(title: Text("C")),
          const ListTile(title: Text("D")),
          const ListTile(title: Text("E")),
        ],
      ),
    );
  }
}

// Item
class ListViewItem extends StatelessWidget {

  final String data;

  const ListViewItem(
    this.data, {
    Key key,
  }) : super(key: key);

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
