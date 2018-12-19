import 'package:flutter/material.dart';

/**
 * 首页
 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class RouteEntity {
  final String name;
  final String route;

  const RouteEntity(this.name, this.route);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgets = [];

  List<RouteEntity> routes = [
    const RouteEntity("列表", "widget_list"),
    const RouteEntity("列表上拉加载", "widget_listview"),
    const RouteEntity("列表下拉刷新", "widget_refreshListView"),
    const RouteEntity("底部导航", "widget_bottomNavigationBar"),
    const RouteEntity("轮播图", "widget_swiper"),
  ];

  @override
  Widget build(BuildContext context) {
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
        itemCount: routes.length,
      ),
    );
  }

  Widget _createWidget(int index) {
    return GestureDetector(
      onTap: () {
        print("route_name: " + routes[index].name);
        Navigator.pushNamed(context, routes[index].route);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white),
        child: new Padding(
          padding: new EdgeInsets.all(15),
          child: new Text(
            routes[index].name,
            style: TextStyle(color: Colors.green, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
