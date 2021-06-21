import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:modamobil/modelVetement.dart';

// ignore: must_be_immutable
class Avatar extends StatefulWidget {
  String genre;
  String objeturl;
  Avatar(this.genre, this.objeturl);

  @override
  State<StatefulWidget> createState() {
    return AvatarState(this.genre, this.objeturl);
  }
}

class AvatarState extends State<Avatar> {
  bool genreBool;
  String genreValue = "";
  String objetValue = "";
  AvatarState(this.genreValue, this.objetValue);

  //CRETION DE LA SCENE
  bool genreSate() {
    if (this.genreValue == "Homme") {
      genreBool = true;
    } else {
      genreBool = false;
    }
    return genreBool;
  }

  // String objetScene = "assets/objet/femme/1.obj";
  void _onSceneCreated(Scene scene) {
    scene.camera.position.z = 10;
    scene.camera.target.y = 2;
    scene.camera.zoom = 1.7;
    // from https://sketchfab.com/3d-models/ruby-rose-2270ee59d38e409491a76451f6c6ef80
    scene.world.add(Object(
      scale: Vector3(10.0, 10.0, 10.0),
      fileName: objetValue,
    ));
  }

  //LISTE IMAGE DE VETEMENTS
  final List<String> listHabitHomme = [
    "assets/images/pologris.jpg",
    "assets/images/ChemiseHomme.jpeg",
    "assets/images/Chemise-bazin.jpeg",
    "assets/images/tee-shirt-orange.jpeg",
    "assets/images/Veste-Homme.jpeg",
  ];

  //LISTE IMAGE DE VETEMENTS
  final List<String> listHabitFemme = [
    "assets/vetementFemme/t-shirt_noir_claire.png",
    "assets/images/jupe.jpeg",
    "assets/images/longuejupenoire.png",
    "assets/images/jupe.jpeg",
  ];

  var vetement1 = ModelVetement(
      "Robe bleu blanc",
      "assets/vetementFemme/robe_bleu_blanc.png",
      "assets/vetementFemme/robe_bleu_blanc/robe_bleu_blanc.obj");
  var vetement2 = ModelVetement(
      "Robe rose",
      "assets/vetementFemme/robe_rose.png",
      "assets/vetementFemme/robe_rose/robe_rose.obj");
  var vetement3 = ModelVetement(
      "Robe soiré rouge",
      "assets/vetementFemme/robe_rouge.png",
      "assets/vetementFemme/robe_rouge_noir/robe_rouge_noir.obj");
  var vetement4 = ModelVetement(
      "Robe bleu blanc",
      "assets/vetementFemme/robe_bleu_blanc.png",
      "assets/vetementFemme/robe_bleu_blanc/robe_bleu_blanc.obj");
  var vetement5 = ModelVetement(
      "Robe rose",
      "assets/vetementFemme/robe_rose.png",
      "assets/vetementFemme/robe_rose/robe_rose.obj");
  var vetement6 = ModelVetement(
      "Robe soiré rouge",
      "assets/vetementFemme/robe_rouge.png",
      "assets/vetementFemme/robe_rouge_noir/robe_rouge_noir.obj");
  

  @override
  Widget build(BuildContext context) {
    List listvetements = [];
    listvetements.add(vetement1);
    listvetements.add(vetement2);
    listvetements.add(vetement3);
    listvetements.add(vetement4);
    listvetements.add(vetement5);
    listvetements.add(vetement6);
    return Scaffold(
      appBar: AppBar(
        title: Text(genreValue),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xE9FFFFFF),
                      Color(0xECF0F0F0),
                      Color(0xCCF5F5F5),
                      Color(0xFFFFFFFF),
                    ],
                  ),
                ),
                child: Cube(
                  onSceneCreated: _onSceneCreated,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 140.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (genreSate())
                      ? listHabitHomme.length
                      : listvetements.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (genreBool) {
                          print("Habit homme");
                        } else {
                          print("Habit Femme");
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Avatar("Femme", listvetements[index].urlobj);
                          }),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 110.0,
                            // color: Colors.red,
                            child: Image.asset(
                              (genreSate())
                                  ? listHabitHomme[index]
                                  : listvetements[index].urlimage,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}