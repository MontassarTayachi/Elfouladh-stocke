class Aciersort {
  final String diametre;
  final String botte;
  final String coulee;
  final String poids;
  final String datefabrication;
  final String agent;
  final String localisation;
  final String dateSorti;
  final String id;
  final tablename;

  Aciersort({
    required this.diametre,
    required this.botte,
    required this.coulee,
    required this.poids,
    required this.datefabrication,
    required this.agent,
    required this.localisation,
    required this.dateSorti,
    required this.id,
    required this.tablename,
  });

  Map<String, dynamic> toJson() {
    return {
      "diametre": diametre,
      "botte": botte,
      "coulee": coulee,
      "poids": poids,
      "dateFabrication": datefabrication,
      "agent": agent,
      "localisation": localisation,
      "date_sorti": dateSorti,
      "id": id,
    };
  }

  String get gettablename => tablename;
}
