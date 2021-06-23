import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modamobil/qrcode/homeqrcode.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeQrcode())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Card(
                  child: Image(
                    image: NetworkImage(
                        "https://image.freepik.com/free-vector/virtual-fitting-room-abstract-concept-illustration_335657-3874.jpg"),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SpinKitFoldingCube(
                color: Colors.pink,
                duration: Duration(seconds: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
