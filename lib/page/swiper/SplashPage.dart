import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/**
 * 轮播图 使用Swiper库
 */
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SpalshState();
  }
}

class _SpalshState extends State<SplashPage> {

  static const String _IS_FIRST = "isFirst";

  int _currentPage = 0;
  List<String> _images = [];


  @override
  void initState() {
    super.initState();
    print("_SpalshState initState()");
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    print("_SpalshState  build()");
    return new Scaffold(
      body: Swiper(
          onIndexChanged: _onIndexChanged,
          loop: false,
          itemCount: _images.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
          itemBuilder: (context, index) {
            print("_SpalshState swiperIndex = ${index}");
            return GestureDetector(
              child: Image.network(
                _images[index],
                fit: BoxFit.fill,
              ),
              onTap: _onTap,
            );
          }),
    );
  }

  _loadImage() {
    Future.delayed(Duration(seconds: 2)).then((onValue) {
      _images.add(
          "http://5b0988e595225.cdn.sohucs.com/images/20170913/6703759e56444a02a7ac19a79e16e748.jpeg");
      _images.add("http://pic26.photophoto.cn/20130320/0005018394353772_b.jpg");
      _images.add("http://pic17.photophoto.cn/20101220/0005018331537449_b.jpg");

      setState(() {});
    });
  }

  void _onIndexChanged(int value) {
    print("_SpalshState _onIndexChanged = ${value}");
    _currentPage = value;
  }

  void _onTap() {
    if (_currentPage == _images.length - 1) {
      Navigator.popAndPushNamed(context, "home");
    }
  }


}
