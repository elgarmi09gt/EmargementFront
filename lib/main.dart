import 'package:flutter/material.dart';

void main() {
  runApp(EmargementApp());
}

class EmargementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ucad",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "UCAD EMARGEMENT",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
