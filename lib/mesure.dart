class Mesure {
  String epaule;
  String lgBras;
  String tourTaille;
  String hautDos;
  String lgJambe;
  String taille;

  int valueEpaule;
  int valueLgBras;
  int valueTourTaille;
  int valueHautDos;
  int valueLgJambe;
  int valueTaille;

  Mesure(
    this.epaule,
    this.valueEpaule,
    this.lgBras,
    this.valueLgBras,
    this.tourTaille,
    this.valueTourTaille,
    this.hautDos,
    this.valueHautDos,
    this.lgJambe,
    this.valueLgJambe,
    this.taille,
    this.valueTaille,
  );

  factory Mesure.fromJson(dynamic json) {
    return Mesure(
      json['epaule'] as String,
      json['valueEpaule'] as int,
      json['lgBras'] as String,
      json['valueLgBras'] as int,
      json['tourTaille'] as String,
      json['valueTourTaille'] as int,
      json['hautDos'] as String,
      json['valueHautDos'] as int,
      json['lgJambe'] as String,
      json['valueLgJambe'] as int,
      json['taille'] as String,
      json['valueTaille'] as int,
    );
  }

  @override
  String toString() {
    return '${this.epaule}\n${this.valueEpaule}';
  }
}
