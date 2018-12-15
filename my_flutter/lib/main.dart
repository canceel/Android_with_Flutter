import 'package:flutter/material.dart';
import 'package:my_flutter/index.dart';
import 'package:my_flutter/app/view/product/product_detail.dart';
import 'dart:ui';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: "",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: _widgetForRoute(window.defaultRouteName),
    );
  }
}

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'index':
      return MyIndex();
    case 'product_detail':
      return ProductDetail(name:"Native",);
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}