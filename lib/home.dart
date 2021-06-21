import 'package:flutter/material.dart';
// import 'package:modamobil/Homme.dart';
import 'package:modamobil/avatar.dart';

import 'package:modamobil/constante.dart';
import 'package:modamobil/optioncard.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// import 'Femme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    final _channel = WebSocketChannel.connect(
      Uri.parse(Constant.websocketIp),
    );
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MODA SHOP',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(5)),
                OptionCard(
                    label: 'HOMME',
                    tap: () {
                      _channel.sink.add('Homme');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Avatar("Homme",
                              "assets/avatarHomme/hommeSansHabit/2.obj");
                        }),
                      );
                    }),
                OptionCard(
                  label: 'FEMME',
                  tap: () {
                    _channel.sink.add('Femme');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Avatar("Femme",
                            "assets/avatarFemme/femmeSansHabit/femmeBrasBaisser.obj");
                      }),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
