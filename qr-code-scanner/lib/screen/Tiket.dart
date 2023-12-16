import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:stoke_scanner/class/AcierSrti.dart';
import 'package:stoke_scanner/data/connect.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../class/Acier.dart';

class Tiket extends StatefulWidget {
  const Tiket({Key? key, required this.Donner}) : super(key: key);

  final String Donner;
  @override
  State<Tiket> createState() => _TiketState();
}

class _TiketState extends State<Tiket> {
  @override
  Widget build(BuildContext context) {
    List<String> splitStringIntoList(String input) {
      List<String> result = input.split('/');
      return result;
    }

    String input = widget.Donner;
    // ignore: unused_local_variable
    List<String> myList = splitStringIntoList(input);
    String convertDateTime(String inputDateTime) {
      DateTime parsedDateTime = DateTime.parse(inputDateTime);
      String formattedDateTime =
          DateFormat('dd-MM-yyyy HH:mm:ss').format(parsedDateTime);
      return formattedDateTime;
    }

    String date = convertDateTime(myList[5]);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ProgressHUD(
        child: Builder(
          builder: (context) {
            return Center(
              child: Padding(
                padding: EdgeInsetsDirectional.all(18.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello ,Save your tiket below   ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TicketWidget(
                        width: 350,
                        isCornerRounded: true,
                        height: 550,
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/photo.png"),
                                    backgroundColor: Colors.white,
                                    radius: 59,
                                  ),
                                  Text(
                                    'ELFOULATH',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    myList[8],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            const Color.fromARGB(104, 0, 0, 0),
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      Text(
                                        myList[7] + "  id" + myList[0],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.pink),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: QrImageView(
                                      data: widget.Donner,
                                      version: QrVersions.auto,
                                      size: 150,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Detail('Diamètre', myList[1]),
                                      Detail('Botte', myList[2]),
                                      Detail('Coulée', myList[3]),
                                      Detail('Poids', myList[4] + " KG"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Detail('Date de fabrication', date),
                                      Detail('Agent', myList[6]),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 100,
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              print("bonjour");
                                              final acier = Acier(
                                                id: myList[0],
                                                diametre: myList[1],
                                                botte: myList[2],
                                                coulee: myList[3],
                                                poids: myList[4],
                                                dateDeFabrication: myList[5],
                                                agent: myList[6],
                                                localisation: myList[7],
                                                Tablena: myList[8],
                                              );
                                              final progress =
                                                  ProgressHUD.of(context);
                                              progress
                                                  ?.showWithText('Loading...');
                                              final db = FactureDB.instance;

                                              // Test Create
                                              await db.createAcier(acier);
                                              Future.delayed(
                                                  Duration(seconds: 1), () {
                                                progress?.dismiss();
                                              });
                                              setState(() {
                                                Navigator.pushNamed(
                                                    context, 'ajouter');
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                backgroundColor: Colors.amber),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.save),
                                                Text("Saved"),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 100,
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              final acier = Aciersort(
                                                diametre: myList[1],
                                                botte: myList[2],
                                                coulee: myList[3],
                                                poids: myList[4],
                                                datefabrication: myList[5],
                                                agent: myList[6],
                                                localisation: myList[7],
                                                tablename: myList[8],
                                                dateSorti:
                                                    DateTime.now().toString(),
                                                id: myList[0],
                                              );
                                              setState(() async {
                                                final progress =
                                                    ProgressHUD.of(context);
                                                progress?.showWithText(
                                                    'Loading...');

                                                final db = FactureDB.instance;

                                                await db
                                                    .ajouter_acier_sort_dans_le_server(
                                                        acier);
                                                db.removeAcier(acier.id);
                                                db.deleteAcierFromserver(acier);
                                                Future.delayed(
                                                    Duration(seconds: 1), () {
                                                  progress?.dismiss();
                                                });
                                              });
                                              Navigator.pushNamed(
                                                  context, 'ajouter');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                backgroundColor: Colors.green),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.delivery_dining,
                                                  color: Colors.white54,
                                                ),
                                                Text("DÉLIVRER",
                                                    style: TextStyle(
                                                        color: Colors.white54)),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget Detail(String titre, String detail) => Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(titre,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w700)),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsets.all(6),
          alignment: Alignment.center,
          child: Text(detail,
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontWeight: FontWeight.w800)),
        )
      ],
    );
