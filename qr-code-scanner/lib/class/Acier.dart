class Acier {
  final String id;
  final String diametre;
  final String botte;
  final String coulee;
  final String poids;
  final String dateDeFabrication;
  final String agent;
  final String localisation;
  final String Tablena;

  Acier({
    required this.id,
    required this.diametre,
    required this.botte,
    required this.coulee,
    required this.poids,
    required this.dateDeFabrication,
    required this.agent,
    required this.localisation,
    required this.Tablena,
  });

  factory Acier.fromJson(Map<String, dynamic> json) {
    return Acier(
      id: json['ID'],
      diametre: json['Diamètre'],
      botte: json['Botte'],
      coulee: json['Coulée'],
      poids: json['Poids'],
      dateDeFabrication: json['Date_de_fabrication'],
      agent: json['Agent'],
      localisation: json['localisation'],
      Tablena: json['Tablena'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Diamètre': diametre,
      'Botte': botte,
      'Coulée': coulee,
      'Poids': poids,
      'Date_de_fabrication': dateDeFabrication,
      'Agent': agent,
      'localisation': localisation,
      'Tablena': Tablena,
    };
  }

  factory Acier.fromMap(Map<String, dynamic> map) {
    return Acier(
      id: map['id'],
      diametre: map['diametre'],
      botte: map['botte'],
      coulee: map['coulee'],
      poids: map['poids'],
      dateDeFabrication: map['dateDeFabrication'],
      agent: map['agent'],
      localisation: map['localisation'],
      Tablena: map['Tablena'],
    );
  }

  String toString() {
    return 'Acier: {'
        'diametre: $diametre, '
        'botte: $botte, '
        'coulee: $coulee, '
        'poids: $poids, '
        'dateDeFabrication: $dateDeFabrication, '
        'agent: $agent, '
        'localisation: $localisation, '
        'id: $id, '
        'Tablena: $Tablena'
        '}';
  }

  String get getId => id;
  String get getDiametre => diametre;
  String get getBotte => botte;
  String get getCoulee => coulee;
  String get getPoids => poids;
  String get getDateDeFabrication => dateDeFabrication;
  String get getAgent => agent;
  String get getLocalisation => localisation;
  String get getTablena => Tablena;
}
