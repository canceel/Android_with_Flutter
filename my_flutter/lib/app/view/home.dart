import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter/app/view/home/latest_publish.dart';
import 'package:my_flutter/app/view/home/home_banner.dart';
import 'package:my_flutter/app/view/home/home_vertical_list.dart';
import 'package:my_flutter/app/data/response/home_data.dart';
import 'package:my_flutter/app/view/home/home_notification.dart';

//数据配置
HomeData bannerData1, bannerData2;
var latestDatas;
var verticalDatas;
var notificationDatas;

class home extends StatelessWidget {
  final topBar = new AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 1.0,
    title: Text(
      "首页",
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: topBar,
      body: homeFul(),
    );
  }
}

class homeFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeFulState();
  }
}

class homeFulState extends State<homeFul> {
  var data;

  @override
  void initState() {
    _httpClient();
  }

  void _httpClient() async {
    var responseBody;
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(
        "http://api-m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=290"));
    var response = await request.close();
    //判断是否请求成功
    if (response.statusCode == 200) {
      //拿到请求的数据
      responseBody = await response.transform(utf8.decoder).join();
      //解析json，拿到对应的jsonArray数据
      var convertDataToJson = jsonDecode(responseBody)["movies"];
      //更新数据
      setState(() {
        data = convertDataToJson;
        initView();
      });
    } else {
      print("error");
    }
  }

  initView() {
    //TopBanner 数据
    bannerData1 = HomeData();
    bannerData2 = HomeData();
    notificationDatas = List<String>();

    bannerData1.name = "数字大礼包";
    bannerData1.description = "BTC、ETH、IH丰厚大礼包等你来夺";
    bannerData1.imageUrl = "assets/images/icon_giftbag.png";
    bannerData2.name = "商品专区";
    bannerData2.description = "手机、电脑、3C、智能穿戴优质豪礼应有尽有";
    bannerData2.imageUrl = "assets/images/icon_prefecture.png";
    //最新揭晓数据
    latestDatas = List<HomeData>();
    verticalDatas = List<HomeData>();
    for (int i = 0; i < data.length; i++) {
      var homeData = HomeData();
      homeData.imageUrl = data[i]["img"];
      homeData.name = data[i]["titleCn"];
      homeData.winner = "获奖者";
      homeData.number = "123";
      homeData.date = "2018-12-12";
      latestDatas.add(homeData);
    }
    //正在夺宝数据
    for (int i = 0; i < data.length; i++) {
      var homeData = HomeData();
      homeData.imageUrl = data[i]["img"];
      homeData.name = data[i]["titleCn"];
      homeData.description = data[i]["commonSpecial"];
      homeData.description1 = data[i]["actorName1"]+"/"+data[i]["actorName2"];
      homeData.number = "123";
      homeData.date = "2018-12-12";
      verticalDatas.add(homeData);
    }
    //通知数据
    for (int i = 0; i < data.length; i++) {
      notificationDatas.add("《"+data[i]["titleCn"]+"》"+data[i]["commonSpecial"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bannerData1 != null && latestDatas != null) {
      return new ListView(
        children: <Widget>[
          TopBanner(
            data1: bannerData1,
            data2: bannerData2,
          ),
          HomeNotification(
            datas: notificationDatas,
          ),
          LatestPublish(title: "正在热映", datas: latestDatas),
          VerticalList(title: "正在热映", datas: verticalDatas),
        ],
      );
    } else {
      return Center(
        child: Text("Empty"),
      );
    }
  }
}
