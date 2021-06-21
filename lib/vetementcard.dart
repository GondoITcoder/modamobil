import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'cloth.dart';
import 'constante.dart';

class VetementCard extends StatelessWidget {
  VetementCard({
    this.cloth,
    this.tap=defaultFunc, 
  });

  final Cloth cloth;
  final Function tap;
 
  static void defaultFunc() {
    print("the function works!");
  }
   @override
  Widget build(BuildContext context) {
     WebSocketChannel channel=IOWebSocketChannel.connect(Constant.websocketIp);
    void _sendMessage(data) {
      channel.sink.add(data);
      print(data);
    }
    return Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(cloth.image),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cloth.nom,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.55,
                        child: Text(
                          cloth.description,
                          maxLines: 3,
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[500]),
                        ),
                      ),
                      Center(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: () {
                            _sendMessage("${cloth.nom}");
                         
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Vetement()),
                            // );
                          },
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.orange,
                          child: Text(
                            "Choisir",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

}

