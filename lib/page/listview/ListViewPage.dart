import 'package:flutter/material.dart';
import 'package:flutter_demo/page/listview/item/ListViewItem.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Widget"),
      ),

      body: ListViewWithDivider(),
    );
  }
}

class ListViewWithDivider extends StatelessWidget {

  Widget divider = Divider(height: 1, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return new ListViewItem("$index");
        },
        separatorBuilder: (BuildContext context, int index) {
          return divider;
        },
        itemCount: 100);
  }
}

List<ListViewItem> generateListData() {
  List<String> keys = new List();
  keys.add("A");
  keys.add("B");
  keys.add("C");
  keys.add("D");
  keys.add("E");
  keys.add("F");
  keys.add("G");
  keys.add("H");
  keys.add("I");
  keys.add("J");
  keys.add("K");
  keys.add("L");

  List<ListViewItem> items = new List();
  keys.forEach((key) => items.add(ListViewItem(key)));
}
