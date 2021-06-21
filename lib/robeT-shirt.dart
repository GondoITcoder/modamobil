import 'package:flutter/material.dart';
import 'package:modamobil/vetementCard.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'cloth.dart';

// ignore: must_be_immutable
class RobeetTshirt extends StatelessWidget {
  final WebSocketChannel channel;

  RobeetTshirt({Key key, @required this.channel}) : super(key: key);

  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }


  // Titre des vêtements

  var p= new Cloth(1,'Body Bleu','JUPE','F','assets/images/bodybleu.PNG','');
  var jupe2= new Cloth(2,'t-shirt2','JUPE','F','assets/images/tee-shirt-orange.jpeg','');



  @override
  Widget build(BuildContext context) {

    List jupeList = [];
    jupeList.add(p);
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


