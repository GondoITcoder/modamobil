import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ListCloth extends StatefulWidget {
  final WebSocketChannel channel;

  ListCloth({Key key, @required this.channel}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ListClothState();
  }
}

class _ListClothState extends State<ListCloth> {
  // Titre des vêtements
  var titleList = [
    "Chemise Homme",
    "Chemise Femme",
    "Chemise Bazin",
    "Jupe",
    "Robe",
    "Tee-shirt Orange",
    "Veste Homme"
  ];

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
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    widget.channel.stream.listen(
      (event) {
        print(event);
      },
    );
    void _sendMessage(data) {
      widget.channel.sink.add(data);

      print(data);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Liste des vêtements",
      //     style: TextStyle(
      //       color: Colors.orange,
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      // ),
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(imgList[index]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        titleList[index],
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        child: Text(
                          descList[index],
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
                            _sendMessage("${titleList[index]}");

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => ListCloth()),
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
        },
      ),
    );
  }
}
