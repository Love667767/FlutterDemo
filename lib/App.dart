import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_demo/page/HomePage.dart';
import 'package:flutter_demo/page/WidgetListPage.dart';
import 'package:flutter_demo/page/listview/ListViewPage.dart';
import 'package:flutter_demo/page/refresh/RefreshListPage.dart';
import 'package:flutter_demo/page/navigator/NavigationPage.dart';
import 'package:flutter_demo/page/swiper/SplashPage.dart';



void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: _registerRoutes(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: SplashPage(),
      home: MyHomePage(title: 'Flutter Demo',),
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return {
      "home": (context) => MyHomePage(
            title: 'Flutter Demo',
          ),
      "widget_list": (context) => WidgetListPage(),
      "widget_listview": (context) => ListViewPage(),
      "widget_refreshListView": (context) => RefreshListPage(),
      "widget_bottomNavigationBar": (context) => NavigationPage(),
      "widget_swiper": (context) => SplashPage(),
    };
  }
}
