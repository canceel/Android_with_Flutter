import 'package:flutter/material.dart';
import 'package:my_flutter/app/view/home.dart';
import 'package:my_flutter/app/view/rankingList.dart';
import 'package:my_flutter/app/view/mine.dart';
import 'package:my_flutter/app/widget/icon_tab.dart';

class MyIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Index();
  }
}

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IndexState();
  }
}

class IndexState extends State<Index> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;
  VoidCallback _voidCallback;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(initialIndex: _currentIndex, length: 3, vsync: this);
    _voidCallback = () {
      setState(() {
        _currentIndex = this._tabController.index;
      });
    };
    _tabController.addListener(_voidCallback);
  }

  @override
  void dispose() {
    _tabController.removeListener(_voidCallback);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TabBarView(
        children: <Widget>[home(), message(), mine()],
        controller: _tabController,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: null,
            indicatorWeight: 1,
            tabs: <IconTab>[
              new IconTab(
                  icon: _currentIndex == 0
                      ? "assets/images/icon_home_press.png"
                      : "assets/images/icon_home_normal.png",
                  text: "首页",
                  color: _currentIndex == 0 ? Colors.deepOrangeAccent : Colors.grey),
              new IconTab(
                  icon: _currentIndex == 1
                      ? "assets/images/icon_rankinglist_press.png"
                      : "assets/images/icon_rankinglist_normal.png",
                  text: "分类",
                  color: _currentIndex == 1 ? Colors.deepOrangeAccent : Colors.grey),
              new IconTab(
                  icon: _currentIndex == 2
                      ? "assets/images/icon_mine_press.png"
                      : "assets/images/icon_mine_normal.png",
                  text: "我的",
                  color: _currentIndex == 2 ? Colors.deepOrangeAccent : Colors.grey),
            ]),
      ),
    );
  }
}
