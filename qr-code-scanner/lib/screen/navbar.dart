import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

class NAVBAR extends StatelessWidget {
  NAVBAR();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(194, 204, 206, 1),
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(),
                child: Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('images/photo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      Text('My Stoke',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              /*child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(200, 24, 154, 211),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                accountName:
                    Text('My Stoke', style: TextStyle(color: Colors.black87)),
                accountEmail: Text('commercial@elfouladh.com.tn. ',
                    style: TextStyle(color: Colors.black87)),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/photo.png'),
                    backgroundColor: Colors.transparent),
              ),*/
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () => Navigator.pushNamed(context, 'Home'),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('A propos'),
            onTap: () => Navigator.pushNamed(context, 'Propos'),
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('Contact'),
            onTap: () => Navigator.pushNamed(context, 'Contact'),
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () => FlutterExitApp.exitApp())
        ],
      ),
    );
  }
}
