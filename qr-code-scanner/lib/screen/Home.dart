import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stoke_scanner/screen/navbar.dart';

class Home extends StatefulWidget {
  Home();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool spiner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NAVBAR(),
      appBar: AppBar(
        title: const Text(
          'My Stoke',
          style: TextStyle(
              color: Color.fromRGBO(0, 151, 230, 1),
              fontWeight: FontWeight.bold,
              fontFamily: 'Preahvihear-Regular'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(236, 240, 241, 1),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(236, 240, 241, 1),
          Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Image(
              image: AssetImage('images/qr_code.jpg'),
              width: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: Color.fromARGB(255, 24, 154, 211),
                  ),
                  label: const Text(
                    'Scanner Tiket',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 24, 154, 211),
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'qrcode');
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => {
                  setState(() {
                    spiner = true;
                    Navigator.pushNamed(context, 'ajouter');
                    spiner = false;
                  })
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Color.fromARGB(255, 24, 154, 211),
                ),
                label: const Text('Consulter',
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 154, 211),
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
