import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget{
  ProductDetail({Key key, this.name: "hahaha",})
      : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}