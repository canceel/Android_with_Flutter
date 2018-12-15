import 'package:flutter/material.dart';
import 'package:my_flutter/app/widget/banner.dart';

//首页通知
class HomeNotification extends StatelessWidget {
  HomeNotification({Key key, this.datas}) : super(key: key);
  final List<String> datas;

  @override
  Widget build(BuildContext context) {
    return HomeNotificationFul(
      datas: datas,
    );
  }
}

class HomeNotificationFul extends StatefulWidget {
  HomeNotificationFul({Key key, this.datas}) : super(key: key);
  final List<String> datas;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeNotificationFulState();
  }
}

class HomeNotificationFulState extends State<HomeNotificationFul> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      color: Colors.white,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(right: 5),
            child: new Image(
              image: new AssetImage("assets/images/icon_notification.png"),
              width: 15,
              height: 15,
            ),
          ),
          new Expanded(
              child: new BannerView(
            height: 20,
            data: widget.datas,
            scrollTime: 1500,
            delayTime: 2,
            buildShowView: (index, data) {
              return new Text(
                data,
                maxLines: 1,
              );
            },
            onBannerClickListener: (index, data) {
              print(index);
            },
          ))
        ],
      ),
    );
  }
}
