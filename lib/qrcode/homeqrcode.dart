import 'package:flutter/material.dart';
import 'mesurewithnumber.dart';

class HomeQrcode extends StatefulWidget {
  @override
  HomeQrcodeState createState() => HomeQrcodeState();
}

class HomeQrcodeState extends State<HomeQrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Bienvenue",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://image.freepik.com/free-vector/woman-trying-clothes-web-application-illustration-female-character-chooses-red-dress-hat-from-online-store-virtually-dresses-them-virtual-fitting-room_241107-892.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // flatButton("Scan QR CODE", ScanPage()),
            // SizedBox(
            //   height: 30.0,
            // ),
            flatButton("Mes mesures", MesureWithNumber()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    // ignore: deprecated_member_use
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      color: Colors.pink,
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.pink, width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
