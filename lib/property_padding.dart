import 'package:flutter/material.dart';
void main() {
  runApp(PaddingApp());
}
class PaddingApp extends StatelessWidget {
  const PaddingApp({super.key});
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Padding")),
        body: Container(
          padding: EdgeInsets.only(left: 20),
          margin: EdgeInsets.all(20),
          height: 200,
          width: 200,
          alignment: Alignment.topLeft,
          color: Colors.blueGrey,
          child: Text(
            'Ayo Belajar Flutter',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ))),
    );
  }
}