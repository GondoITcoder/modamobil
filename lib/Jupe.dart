import 'package:flutter/material.dart';
import 'package:modamobil/vetementCard.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'cloth.dart';

// ignore: must_be_immutable
class JupeEtPantalon extends StatelessWidget {
  final WebSocketChannel channel;

  JupeEtPantalon({Key key, @required this.channel}) : super(key: key);

  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }


  // Titre des vêtements

  var jupe1= new Cloth(1,'Jupe noire','JUPE','F','assets/images/longuejupenoire.PNG','');
  var jupe2= new Cloth(2,'jupe panthere','JUPE','F','assets/images/jupepanthere.PNG','');



  @override
  Widget build(BuildContext context) {

    List jupeList = [];
    jupeList.add(jupe1);
    jupeList.add(jupe2);
    return Scaffold(
      
      body: ListView.builder(
        itemCount: jupeList.length,
        itemBuilder: (context, index) {
          return VetementCard(cloth:jupeList[index]);
        },
      ),
    );
  }
}


