import 'package:flutter/material.dart';
import 'package:modamobil/vetementCard.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'cloth.dart';

// ignore: must_be_immutable
class Pantalon extends StatelessWidget {
  final WebSocketChannel channel;

  Pantalon({Key key, @required this.channel}) : super(key: key);

  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }


  // Titre des vêtements

  var p1= new Cloth(2,'Polo gris','T-shirt','M','assets/images/pologris.jpg','');
  var p2= new Cloth(2,'Pantalon Bleu marine','JUPE','F','assets/images/Veste-Homme.jpeg','');
  var p3= new Cloth(3,'Pantalon Bogolan','JUPE','F','assets/images/Veste-Homme.jpeg','');
  var p4= new Cloth(2,'Polo gris','T-shirt','M','assets/images/pologris.jpg','');
  var p5= new Cloth(2,'Pantalon Bleu marine','JUPE','F','assets/images/Veste-Homme.jpeg','');
  var p6= new Cloth(3,'Pantalon Bogolan','JUPE','F','assets/images/Veste-Homme.jpeg','');



  @override
  Widget build(BuildContext context) {

    List pantalon = [];
    pantalon.add(p1);
    pantalon.add(p2);
    pantalon.add(p3);
    pantalon.add(p4);
    pantalon.add(p5);
    pantalon.add(p6);
    return Scaffold(
      
      body: ListView.builder(
        itemCount: pantalon.length,
        itemBuilder: (context, index) {
          return VetementCard(cloth:pantalon[index]);
        },
      ),
    );
  }
}


