import 'package:flutter/material.dart';

/**
 * 首页
 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgets = [];

  List<String> routeNames = [
    "widget_list",
    "widget_listview",
    "widget_refresh"
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return _createWidget(index);
        },
        separatorBuilder: (context, index) {
          return new Divider(
            height: 1,
            color: Colors.grey,
          );
        },
        itemCount: routeNames.length,
      ),
    );
  }

  Widget _createWidget(int index) {
    return new Padding(
      padding: EdgeInsets.all(20),
      child: new GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeNames[index]);
          print("route_name: " + routeNames[index]);
        },
        child: new Center(
          child: new Padding(
            padding: new EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: new Text(
              routeNames[index].toUpperCase(),
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
