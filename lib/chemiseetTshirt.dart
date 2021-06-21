import 'package:flutter/material.dart';
import 'package:modamobil/vetementCard.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'cloth.dart';

// ignore: must_be_immutable
class ChemiseetTshirt extends StatelessWidget {
  final WebSocketChannel channel;

  ChemiseetTshirt({Key key, @required this.channel}) : super(key: key);

  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }

  // Titre des vêtements

  var t1 = new Cloth(
      1, 'T-shirt jaune', 'T-shirt', 'M', 'assets/images/Tshirtjaune.png', '');
  var t2 = new Cloth(
      2, 'T-shirt noir', 'T-shirt', 'M', 'assets/images/Tshirtnoire.png', '');
  var t3 = new Cloth(
      3, 'T-shirt orange', 'T-shirt', 'M', 'assets/images/Tshirtnoire.png', '');

  var t4 = new Cloth(
      1, 'T-shirt vert', 'T-shirt', 'M', 'assets/images/Tshirtjaune.png', '');
  var t5 = new Cloth(
      2, 'T-shirt bleu', 'T-shirt', 'M', 'assets/images/Tshirtnoire.png', '');
  var t6 = new Cloth(
      3, 'T-shirt rose', 'T-shirt', 'M', 'assets/images/Tshirtnoire.png', '');

  @override
  Widget build(BuildContext context) {
    List teeShirt = [];
    teeShirt.add(t1);
    teeShirt.add(t2);
    teeShirt.add(t3);
    teeShirt.add(t4);
    teeShirt.add(t5);
    teeShirt.add(t6);
    return Scaffold(
      body: ListView.builder(
        itemCount: teeShirt.length,
        itemBuilder: (context, index) {
          return VetementCard(cloth: teeShirt[index]);
        },
      ),
    );
  }
}
