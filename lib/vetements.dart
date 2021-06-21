import 'package:flutter/material.dart';
import 'package:modamobil/vetementCard.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'cloth.dart';

// ignore: must_be_immutable
class Vetement extends StatelessWidget {
  final WebSocketChannel channel;

  Vetement({Key key, @required this.channel}) : super(key: key);

  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }


  // Titre des vêtements

  var jupe1= new Cloth(1,'jupe1','JUPE','F','assets/images/jupe.jpeg','');
  var jupe2= new Cloth(2,'jupe2','JUPE','F','assets/images/jupe.jpeg','');
  var jupe3= new Cloth(3,'jupe3','JUPE','F','assets/images/jupe.jpeg','');
  var jupe4= new Cloth(4,'jupe4','JUPE','F','assets/images/jupe.jpeg','');



  // Description des vêtements
  var descList = [
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum.",
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum.",
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum.",
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum.",
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum.",
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum."
  ];

  // Liste des images
  var imgList = [
    "assets/images/ChemiseHomme.jpeg",
    "assets/images/Chemise-Femme.jpeg",
    "assets/images/Chemise-bazin.jpeg",
    "assets/images/jupe.jpeg",
    "assets/images/robe.jpeg",
    "assets/images/tee-shirt-orange.jpeg",
    "assets/images/Veste-Homme.jpeg"
  ];


  @override
  Widget build(BuildContext context) {
    // void _sendMessage(data) {
    //   channel.sink.add(data);
    //   print(data);
    // }
    
    List jupeList = [];
    jupeList.add(jupe1);
    jupeList.add(jupe2);
    jupeList.add(jupe3);
    jupeList.add(jupe4);
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


