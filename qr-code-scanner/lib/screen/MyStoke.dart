import 'package:flutter/material.dart';
import 'package:stoke_scanner/screen/Tiket.dart';
import '../data/connect.dart';
import 'package:intl/intl.dart';

class MyStoke extends StatefulWidget {
  MyStoke({Key? key, required this.Table}) : super(key: key);
  final String Table;
  @override
  State<MyStoke> createState() => _MyStokeState();
}

class _MyStokeState extends State<MyStoke> {
  List<Map<String, dynamic>> _acierList = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> _loadAcierList() async {
    final db = FactureDB.instance;
    _acierList =
        (await db.readacier(widget.Table)).cast<Map<String, dynamic>>();
    setState(() {});
  }

  Future refresh() async {
    setState(() => isLoading = true);

    _loadAcierList();

    setState(() => isLoading = false);
  }

  Widget build(BuildContext context) {
    refresh();
    String lo = widget.Table;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Stoke  ' + lo,
            style: TextStyle(
                color: Color.fromRGBO(0, 151, 230, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'Preahvihear-Regular'),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(236, 240, 241, 1),
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: _acierList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(4),
              child: bouton(
                  "${_acierList[index]["Date_de_fabrication"]}",
                  "${_acierList[index]["ID"]}",
                  "${_acierList[index]["ID"]}/${_acierList[index]["Diamètre"]}/${_acierList[index]["Botte"]}/${_acierList[index]["Coulée"]}/${_acierList[index]["Poids"]}/${_acierList[index]["Date_de_fabrication"]}/${_acierList[index]["Agent"]}/${_acierList[index]["localisation"]}/${_acierList[index]["Tablena"]}"),
              /* title: Text('ID: ${_acierList[index]["Botte"]}'),
              subtitle: Text('Diamètre: ${_acierList[index]["Diamètre"]}'),*/
            );
          },
        ));
  }

  Widget bouton(String text, String id, String donner) => Container(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Tiket(
                                  Donner: donner,
                                )),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Id " + id,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'Preahvihear-Regular'),
                        ),
                        Text(
                          " Time " + convertDateTime(text),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'Preahvihear-Regular'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.redAccent,
                  child: IconButton(
                    onPressed: () async {
                      setState(() async {
                        final db = FactureDB.instance;
                        final rowsDeleted = await db.removeAcier(id);
                        refresh();
                      });
                    },
                    color: Colors.white,
                    icon: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
  String convertDateTime(String inputDateTime) {
    DateTime parsedDateTime = DateTime.parse(inputDateTime);
    String formattedDateTime =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(parsedDateTime);
    return formattedDateTime;
  }
}
