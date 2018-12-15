import 'package:flutter/material.dart';
import 'package:my_flutter/app/data/response/home_data.dart';
import 'package:my_flutter/app/view/product/product_detail.dart';

class LatestPublish extends StatelessWidget {
  LatestPublish({Key key, this.title, this.datas}) : super(key: key);
  final String title;
  final List<HomeData> datas;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return horizontalMain(context,title, datas);
  }
}

Widget horizontalMain(BuildContext context,String title, List<HomeData> datas) {
  return Container(
    child: new Column(
      children: [
        new Container(
          margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: new Row(
            children: [
              new Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              new Expanded(child: new Text("")),
              new GestureDetector(
                onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return ProductDetail(name: "查看更多",);
                })),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "更多",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    new Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        new SizedBox(
          child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: datas.length,
              itemBuilder: (context, index) => Container(
                    child: HorizontalItem(context,datas[index]),
                  )),
          height: 170,

        ),
      ],
    ),
  );
}

Widget HorizontalItem(BuildContext context,HomeData data) {
  return new Container(
    width: 100,
    color: Colors.white,
    margin: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
    child: new GestureDetector(
      onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context){
        return ProductDetail(name: data.name,);
      })),
      child: new Column(
        children: <Widget>[
          Image.network(
            data.imageUrl,
            width: 100,
            height: 70,
            fit: BoxFit.fill,
          ),
          new Text(
            data.name,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            maxLines: 2,
          ),
          new Text(
            "${data.winner}",
            style: new TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 14,
            ),
            maxLines: 1,
          ),
          new Text(
            "${data.number}",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
            maxLines: 1,
          ),
          new Text(
            "${data.date}",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
            maxLines: 1,
          ),
        ],
      ),
    ),
  );
}

