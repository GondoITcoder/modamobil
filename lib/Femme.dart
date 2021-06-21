import 'package:flutter/material.dart';
import 'package:modamobil/customAppbar.dart';
import 'package:modamobil/robeT-shirt.dart';
import 'package:web_socket_channel/io.dart';
import 'Jupe.dart';
import 'constante.dart';


class Femme extends StatelessWidget {
  const Femme({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      JupeEtPantalon(channel : IOWebSocketChannel.connect(Constant.websocketIp)),
      RobeetTshirt(channel : IOWebSocketChannel.connect(Constant.websocketIp)),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'Jupes'),
      const Tab(text: 'Robes'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: CustomAppbar(kTabs: _kTabs,title:'VETEMENTS FEMME'),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }

  
}




