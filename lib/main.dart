import 'package:flutter/material.dart';
import 'package:modamobil/qrcode/homeqrcode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MODA VETEMENTS',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeQrcode(),
      debugShowCheckedModeBanner: false,
    );
  }
}
