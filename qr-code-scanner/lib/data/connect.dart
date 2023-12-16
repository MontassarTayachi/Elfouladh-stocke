import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stoke_scanner/class/Acier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stoke_scanner/class/AcierSrti.dart';

class FactureDB {
  static final FactureDB instance = FactureDB._initDB();
  static Database? _database;

  FactureDB._initDB();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(''' 
     CREATE TABLE IF NOT EXISTS Acier (
        ID TEXT,
        Tablena TEXT,
        Diamètre TEXT,
        Botte TEXT,
        Coulée TEXT,
        Poids TEXT,
        Date_de_fabrication TEXT,
        Agent TEXT,
        localisation TEXT,
        PRIMARY KEY (ID, Tablena)
          )''');
  }

  Future<void> createAcier(Acier acier) async {
    final db = await database;
    try {
      await db.insert('Acier', acier.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> readFacture(int id) async {
    final db = await database;

    final result =
        await db.query('Acier', where: 'ID = ?', whereArgs: [id.toString()]);

    return result;
  }

  Future<void> deleteAllData() async {
    final db = await database;
    await db.delete('Acier');
  }

  Future<List<Map<String, dynamic>>> readacier(String table) async {
    final db = await database;

    final result = await db.query(
      'Acier',
      where: 'Tablena = ?',
      whereArgs: [table.toString()],
      orderBy: 'CAST(id AS INTEGER) DESC',
    );

    return result;
  }

  Future<void> Dletename(String table) async {
    final db =
        await database; // Assurez-vous d'avoir défini la variable 'database'

    await db.delete(
      'Acier',
      where: 'Tablena = ?',
      whereArgs: [table.toString()],
    );
  }

  Future<void> fetchData1() async {
    var response =
        await http.get(Uri.parse("http://172.20.80.34:4000/select/BILLETTES"));

    if (response.statusCode == 200) {
      var responseData = response.body;

      var jsonData = json.decode(responseData);

      List<Acier> aciers = [];
      for (var acierData in jsonData) {
        Acier acier = Acier(
          diametre: acierData['diametre'].toString(),
          botte: acierData['botte'].toString(),
          coulee: acierData['coulee'].toString(),
          poids: acierData['poids'].toString(),
          dateDeFabrication: acierData['datefabrication'].toString(),
          agent: acierData['agent'].toString(),
          localisation: acierData['localisation'].toString(),
          id: acierData['id'].toString(),
          Tablena: 'BILLETTES',
        );
        aciers.add(acier);
      }

      for (var acier in aciers) {
        final db = FactureDB.instance;

        await db.createAcier(acier);
      }
    }
  }

  Future<void> fetchData2() async {
    var response = await http
        .get(Uri.parse("http://172.20.80.34:4000/select/ROND_A_BETON"));

    if (response.statusCode == 200) {
      var responseData = response.body;

      var jsonData = json.decode(responseData);

      List<Acier> aciers = [];
      for (var acierData in jsonData) {
        Acier acier = Acier(
          diametre: acierData['diametre'].toString(),
          botte: acierData['botte'].toString(),
          coulee: acierData['coulee'].toString(),
          poids: acierData['poids'].toString(),
          dateDeFabrication: acierData['datefabrication'].toString(),
          agent: acierData['agent'].toString(),
          localisation: acierData['localisation'].toString(),
          id: acierData['id'].toString(),
          Tablena: 'ROND_A_BETON',
        );
        aciers.add(acier);
      }

      for (var acier in aciers) {
        final db = FactureDB.instance;

        await db.createAcier(acier);
      }
    }
  }

  Future<void> fetchData3() async {
    var response =
        await http.get(Uri.parse("http://172.20.80.34:4000/select/FILS"));

    if (response.statusCode == 200) {
      var responseData = response.body;

      var jsonData = json.decode(responseData);

      List<Acier> aciers = [];
      for (var acierData in jsonData) {
        Acier acier = Acier(
          diametre: acierData['diametre'].toString(),
          botte: acierData['botte'].toString(),
          coulee: acierData['coulee'].toString(),
          poids: acierData['poids'].toString(),
          dateDeFabrication: acierData['datefabrication'].toString(),
          agent: acierData['agent'].toString(),
          localisation: acierData['localisation'].toString(),
          id: acierData['id'].toString(),
          Tablena: 'FILS',
        );
        aciers.add(acier);
      }

      for (var acier in aciers) {
        final db = FactureDB.instance;

        await db.createAcier(acier);
      }
    }
  }

  Future<void> fetchData4() async {
    var response = await http.get(
        Uri.parse("http://172.20.80.34:4000/select/STRUCTURES_METALIQUES"));

    if (response.statusCode == 200) {
      var responseData = response.body;

      var jsonData = json.decode(responseData);

      List<Acier> aciers = [];
      for (var acierData in jsonData) {
        Acier acier = Acier(
          diametre: acierData['diametre'].toString(),
          botte: acierData['botte'].toString(),
          coulee: acierData['coulee'].toString(),
          poids: acierData['poids'].toString(),
          dateDeFabrication: acierData['datefabrication'].toString(),
          agent: acierData['agent'].toString(),
          localisation: acierData['localisation'].toString(),
          id: acierData['id'].toString(),
          Tablena: 'STRUCTURES_METALIQUES',
        );
        aciers.add(acier);
      }

      for (var acier in aciers) {
        final db = FactureDB.instance;

        await db.createAcier(acier);
      }
    }
  }

  Future<List<Map<String, dynamic>>> readAllAcier() async {
    fetchData1();
    fetchData2();
    fetchData3();
    fetchData4();
    final db = await database;
    final result = await db.query('Acier');
    return result;
  }

  Future<int> removeAcier(String id) async {
    final db = await database;

    final result =
        await db.delete('Acier', where: 'ID = ?', whereArgs: [id.toString()]);

    return result;
  }

  Future<void> deleteAcierFromserver(Aciersort acier) async {
    final deleteUrl =
        "http://172.20.80.34:4000/delete/${acier.tablename}/${acier.id}";

    /*try {
      final insertResponse = await http.post(Uri.parse(insertUrl),
          body: json.encode(acier.toJson()));
      if (insertResponse.statusCode == 200) {
        print('Données insérées avec succès.');
      } else {
        print(
            'Erreur lors de l\'insertion des données. Code: ${insertResponse.statusCode}');
      }*/

    final deleteResponse = await http.delete(Uri.parse(deleteUrl));
    if (deleteResponse.statusCode == 200) {
      print('Données supprimées avec succès.');
    } else {
      print(
          'Erreur lors de la suppression des données. Code: ${deleteResponse.statusCode}');
    }
    /* } catch (error) {
      print('Une erreur s\'est produite : $error');
    }*/
  }

  Future<void> ajouter_acier_sort_dans_le_server(Aciersort acier) async {
    final insertUrl =
        "http://172.20.80.34:4000/insert/${acier.tablename}_sortir";
    Map<String, dynamic> body = {
      "diametre": acier.diametre,
      "botte": acier.botte,
      "coulee": acier.coulee,
      "poids": acier.poids,
      "dateFabrication": acier.datefabrication,
      "agent": acier.agent,
      "localisation": acier.localisation,
      "date_sorti": acier.dateSorti, // Use the defined variable
      "id": acier.id,
    };
    final insertResponse = await http.post(Uri.parse(insertUrl),
        headers: {'Content-Type': 'application/json'}, body: json.encode(body));
  }
}
