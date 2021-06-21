import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modamobil/avatar.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../constante.dart';

// ignore: must_be_immutable
class MesureWithNumber extends StatefulWidget {
  @override
  MesureWithNumberState createState() => MesureWithNumberState();
}

class MesureWithNumberState extends State<MesureWithNumber> {
  final channel = WebSocketChannel.connect(
    Uri.parse(Constant.websocketIp),
  );

  // final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  void incrementCounter() {
    setState(() {});
  }

  Widget donneMesure() {
    // ignore: non_constant_identifier_names
    String T, LE, LB, LJ, TT, HD, S;
    return StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          Map<String, dynamic> user = jsonDecode(snapshot.data);
          T = user['Taille'];
          LE = user['Epaule'];
          LB = user['LongueurBras'];
          LJ = user['LongueurJambe'];
          TT = user['TourTaille'];
          HD = user['HauteurDos'];
          S = user['Size'];
        } else {
          String objText =
              '{"t": "0", "e": "0", "lb": "0", "lj": "0", "tt": "0", "hd": "0", "s": ""}';
          Map<String, dynamic> user = jsonDecode(objText);
          T = user['t'];
          LE = user['e'];
          LB = user['lb'];
          LJ = user['lj'];
          TT = user['tt'];
          HD = user['hd'];
          S = user['s'];
        }

        return SingleChildScrollView(
          child: new Container(
            color: Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: new Stack(fit: StackFit.loose, children: <Widget>[
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            width: 140.0,
                            height: 140.0,
                            child: Text(
                              S,
                              style: TextStyle(
                                fontSize: 120,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Text(
                                'Informations Mesure',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Text(
                                "Taille",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                hintText: "$T m",
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Epaule',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: InputDecoration(
                              hintText: "$LE cm",
                              hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Tour Taille',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: InputDecoration(
                              hintText: "$TT cm",
                              hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Hauteur Dos',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: InputDecoration(
                              hintText: "$HD cm",
                              hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Text(
                                'Longueur bras',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: InputDecoration(
                              hintText: "$LB cm",
                              hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Text(
                                'Longueur Jambe',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                hintText: "$LJ cm",
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final floatingButtons = List<UnicornButton>();
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Obtenir Mesure",
        currentButton: FloatingActionButton(
          heroTag: "Mesure",
          backgroundColor: Colors.pink,
          mini: true,
          child: Icon(Icons.cut),
          onPressed: () {
            channel.sink.add("EnvoyerMesure");
            print('bouton mesure');
          },
        ),
      ),
    );
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Avatar Homme",
        currentButton: FloatingActionButton(
          onPressed: () {
            print('Boutton avatar Homme');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Avatar(
                        "Homme", "assets/avatarHomme/hommeSansHabit/2.obj")));
          },
          heroTag: "Avatar Homme",
          backgroundColor: Colors.pink,
          mini: true,
          child: Icon(Icons.male),
        ),
      ),
    );
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Avatar Femme",
        currentButton: FloatingActionButton(
          onPressed: () {
            print('Boutton avatar Femme');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Avatar("Femme",
                        "assets/avatarFemme/femmeSansHabit/femmeBrasBaisser.obj")));
          },
          heroTag: "Avatar Femme",
          backgroundColor: Colors.pink,
          mini: true,
          child: Icon(
            Icons.female,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Mesures"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: donneMesure()),
            ],
          ),
        ),
      ),
      floatingActionButton: UnicornDialer(
          parentButtonBackground: Colors.pink,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.menu),
          childButtons: floatingButtons),
    );
  }
}
