import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(236, 240, 241, 1),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
              width: 350,
              height: 350,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(24, 175, 96, 187),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  )),
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contactez-nous',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(0, 151, 230, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Preahvihear-Regular'),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone),
                        Text(
                          '(216) + 72 473 222 / 72 473 054',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fax),
                        Text(
                          '(216) + 72 473 100                       ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mail),
                        Text(
                          'commercial@elfouladh.com.tn   ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          'Menzel Bourguiba 7050 Tunisie   ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ])),
        ));
  }
}
