import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [hearderSection(), textSection(), buttonSection()],
            ),
    );
  }

  signIn(String login, String pass) async {
    var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'username': login, 'password': pass};
    var url = "http://localhost:3000/auth/login";
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString("token", jsonData["token"]);
      });
    }
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          txtEmailSection("Login ", Icons.email),
          SizedBox(height: 30.0),
          txtPassSection("Mot de Passe", Icons.lock),
        ],
      ),
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passController.text);
        },
        color: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  TextFormField txtEmailSection(String title, IconData iconData) {
    return TextFormField(
      controller: emailController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(iconData)),
    );
  }

  TextFormField txtPassSection(String title, IconData iconData) {
    return TextFormField(
      controller: passController,
      obscureText: true,
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
