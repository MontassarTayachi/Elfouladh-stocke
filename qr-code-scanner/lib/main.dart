import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:stoke_scanner/screen/myFile.dart';
import 'screen/Contact.dart';
import 'screen/Home.dart';
import 'screen/MyStoke.dart';
import 'screen/Qrview.dart';
import 'screen/propos.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(236, 240, 241, 1),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(236, 240, 241, 1)),
        useMaterial3: true,
      ),
      routes: {
        'Home': (context) => Home(),
        'Contact': (context) => Contact(),
        'Propos': (context) => SnappingList(),
        'ajouter': (context) => myFile(),
        'qrcode': (context) => QRViewExample(),
      },
      home: const Splashscreen(),
    );
  }
}

class Splashscreen extends StatelessWidget {
  const Splashscreen();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Home(),
      splash: Column(children: [
        Image.asset(
          'images/mystoke.png',
        ),
      ]),
      backgroundColor: Colors.white,
      duration: 4000,
      splashIconSize: 250,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
