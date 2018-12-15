import 'package:flutter/material.dart';
import 'package:my_flutter/app/data/response/home_data.dart';

class VerticalList extends StatelessWidget {
  VerticalList({Key key, this.title, this.datas}) : super(key: key);
  final String title;
  final List<HomeData> datas;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(top: 10),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            width: 500,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          new SizedBox(
            child: new Container(
              margin: const EdgeInsets.only(bottom: 1),
              child: VerticalItemGroup(
                datas: datas,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VerticalItemGroup extends StatelessWidget {
  VerticalItemGroup({Key key, this.datas}) : super(key: key);
  final List<HomeData> datas;

  @override
  Widget build(BuildContext context) {
    return VerticalItemGroupFul(
      datas: datas,
    );
  }
}

class VerticalItemGroupFul extends StatefulWidget {
  VerticalItemGroupFul({Key key, this.datas}) : super(key: key);
  final List<HomeData> datas;

  @override
  State<StatefulWidget> createState() {
    return VerticalItemGroupFulState();
  }
}

class VerticalItemGroupFulState extends State<VerticalItemGroupFul> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widget.datas.length,
        itemBuilder: (context, index) => Container(
              child: VerticalItem(context, widget.datas[index]),
            ));
  }
}

//
Widget VerticalItem(BuildContext context, HomeData data) {
  return new Container(
    color: Colors.white,
    height: 90,
    padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
    margin: const EdgeInsets.only(top: 1),
    child: new Row(
      children: <Widget>[
        Image.network(
          data.imageUrl,
          height: 70,
          width: 93,
          fit: BoxFit.fill,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              data.name,
              style: TextStyle(fontSize: 14, color: Colors.black),
              maxLines: 2,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.description,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.deepOrange),
                  maxLines: 1,
                ),
                Text(
                  data.description1,
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
