import 'package:flutter/material.dart';
import 'package:my_flutter/app/data/response/home_data.dart';
import 'package:my_flutter/app/view/product/product_detail.dart';

class TopBanner extends StatelessWidget {
  TopBanner({Key key, this.data1, this.data2})
      : super(key: key);
  final HomeData data1;
  final HomeData data2;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: BannerItem(
                  data: data1,
                )),
            new Expanded(
                child: BannerItem(
                  data: data2,
                )),
          ],
        ));
  }
}

class BannerItem extends StatefulWidget {
  const BannerItem({Key key, this.data})
      : assert(data != null),
        super(key: key);
  final HomeData data;

  @override
  Widget build(BuildContext context) {
    return BannerItem();
  }

  @override
  State<StatefulWidget> createState() {
    return BannerItemState();
  }
}

class BannerItemState extends State<BannerItem> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () =>
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return ProductDetail(
              name: widget.data.name,
            );
          })),
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new Container(
            child: Image(image: new AssetImage(widget.data.imageUrl)),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "${widget.data.name}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 5, right: 20),
                  child: new Text(
                    "${widget.data.description}",
                    style: TextStyle(color: Colors.grey[300], fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
