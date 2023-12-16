import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:stoke_scanner/data/connect.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    bool test = false;

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Setting ',
          style: TextStyle(
              color: Color.fromRGBO(0, 151, 230, 1),
              fontWeight: FontWeight.bold,
              fontFamily: 'Preahvihear-Regular'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(236, 240, 241, 1),
        elevation: 0.0,
      ),
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return Center(
            child: Container(
              child: ColumnScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.refresh,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');
                                        final db = FactureDB.instance;
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        db.fetchData1();
                                        db.fetchData2();
                                        db.fetchData3();
                                        db.fetchData4();
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Refrech all Table',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.refresh,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');
                                        final db = FactureDB.instance;
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        db.fetchData1();
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('BILLETTES'.toLowerCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.refresh,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');
                                        final db = FactureDB.instance;
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        db.fetchData2();
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Rand A Beton",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.refresh,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');
                                        final db = FactureDB.instance;
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        db.fetchData3();
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Fils",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.refresh,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');
                                        final db = FactureDB.instance;
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        db.fetchData4();
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Structures Metaliques",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.delete,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');

                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        final db = FactureDB.instance;
                                        db.deleteAllData();
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Delete all Table',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.delete,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');

                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        final db = FactureDB.instance;
                                        db.Dletename("BILLETTES");
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Billettes',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.delete,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');

                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        final db = FactureDB.instance;
                                        db.Dletename("ROND_A_BETON");
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Rond A Beton',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.delete,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');

                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        final db = FactureDB.instance;
                                        db.Dletename("FILS");
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Fils',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent, // Couleur de fond bleu
                                borderRadius:
                                    BorderRadius.circular(50), // Bords arrondis
                              ),
                              child: Icon(Icons.delete,
                                  color: Color.fromRGBO(236, 240, 241, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.7,
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');

                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          progress?.dismiss();
                                        });
                                        final db = FactureDB.instance;
                                        db.Dletename("STRUCTURES_METALIQUES");
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Structures Metaliques',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
