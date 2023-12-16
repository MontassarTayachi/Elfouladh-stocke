import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stoke_scanner/class/Acier.dart';
import '../data/connect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Database Test App',
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  String responseData = '';

  /*Future<void> fetchData() async {
    var response =
        await http.get(Uri.parse("http://172.20.80.34:4000/select/BILLETTES"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        responseData = data.toString();
      });
    } else {
      setState(() {
        responseData = "Request failed with status: ${response.statusCode}";
      });
    }
  }*/
  Future<void> fetchData() async {
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
        print(acier);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 20),
            Text(responseData),
          ],
        ),
      ),
    );
  }
}
