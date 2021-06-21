class Cloth {
  int id;
  String nom;
  String type;
  String genre;
  String image;
  String description;
  Cloth(int id, String nom, String type, String genre, String image,String description) {
    this.id = id;
    this.nom = nom;
    this.type = type;
    this.genre = genre;
    this.image = image;
    this.description = description;
  }

  String voirChoixGenre() {
    return this.genre;
  }

  void choisirGenre(String choixgenre) {
    this.genre = choixgenre;
  }
}
