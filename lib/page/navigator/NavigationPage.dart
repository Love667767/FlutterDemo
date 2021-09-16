import 'package:flutter/material.dart';
import 'package:flutter_demo/page/navigator/MainPage.dart';
import 'package:flutter_demo/page/navigator/DiscoveryPage.dart';
import 'package:flutter_demo/page/navigator/MinePage.dart';


class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NavigationState();
  }
}

class _NavigationState extends State<NavigationPage> {

  int _currentPage = 0;

  PageView _pageView;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);

    _pageView = new PageView(
      children: [
        new MainPage(),
        new DiscoveryPage(),
        new MinePage(),
      ],
      controller: _pageController,
      onPageChanged: _onPageChanged,
    );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _pageView,
      drawer: const Drawer(child: Text("Title")),

      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.account_balance), title: Text("首页")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add_photo_alternate), title: Text("发现")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle), title: Text("个人中心")),
        ],
        onTap: _onTap,
        currentIndex: _currentPage,
      ),
    );
  }

  _onTap(int index) {
    print("onTap = ${index}");
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  _onPageChanged(int page) {
    print("currentPage = ${page}");
    setState(() {
      this._currentPage = page;
    });
  }
}
