import 'package:flutter/material.dart';
import 'package:modamobil/Pantalon.dart';
import 'package:modamobil/chemiseetTshirt.dart';
import 'package:modamobil/customAppbar.dart';
import 'package:web_socket_channel/io.dart';
import 'constante.dart';


class Homme extends StatelessWidget {
  const Homme({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      ChemiseetTshirt(channel : IOWebSocketChannel.connect(Constant.websocketIp)),
      Pantalon(channel : IOWebSocketChannel.connect(Constant.websocketIp)),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'T-shirt'),
      const Tab(text: 'Pantalon'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: CustomAppbar(kTabs:_kTabs,title:'VETEMENTS HOMME'),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }

  
}
