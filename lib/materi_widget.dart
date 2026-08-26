import 'package:flutter/material.dart';
void main() {
  runApp(StackApp());
}
class StackApp extends StatelessWidget {
  const StackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Stack Widget")),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.green,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Satu",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.red,
              alignment: Alignment.bottomCenter,
              height: 400.0,
              width: 300.0,
              child: Text(
                "Dua",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.deepPurple,
              alignment: Alignment.bottomCenter,
              height: 200.0,
              width: 200.0,
              child: Text(
                "Tiga",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}