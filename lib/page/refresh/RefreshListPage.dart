import 'package:flutter/material.dart';


/**
 * 下拉刷新
 */
class RefreshListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh ListView Widget"),
      ),
      body: InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  ListViewState createState() {
    return new ListViewState();
  }
}

class ListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
//    generateListData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_words[index] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 20) {
              //获取数据
              generateListData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)
                ),
              );
            } else {
              //已经加载了20条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
              );
            }
          }
          //显示单词列表项

          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
        itemCount: _words.length);
  }

  void generateListData() {
    List<String> strs = List();
    strs.add("A");
    strs.add("B");
    strs.add("C");
    strs.add("D");
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1, strs);
      setState(() {
//      _words = _words;
      });
    });
  }
}
