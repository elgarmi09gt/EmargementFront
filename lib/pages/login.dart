import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: ListView(
        children: [hearderSection(), textSection(), buttonSection()],
      ),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          txtSection("Login ", Icons.email),
          SizedBox(height: 30.0),
          txtSection("Mot de Passe", Icons.lock),
        ],
      ),
    );
  }

  TextFormField txtSection(String title, IconData iconData) {
    return TextFormField(
      obscureText: title == "Mot de Passe" ? true : false,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(iconData)),
    );
  }

  Container hearderSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text(
        "UCAD Emargement",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
