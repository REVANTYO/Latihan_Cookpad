import 'package:flutter/material.dart';
void main() {
  runApp(GridViewApp());
}

class GridViewApp extends StatelessWidget {
  const GridViewApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh GridView Widget")),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(
                "1",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.red,
              alignment: Alignment.center,
              height: 400.0,
              width: 300.0,
              child: Text(
                "2",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.deepPurple,
              alignment: Alignment.center,
              height: 200.0,
              width: 200.0,
              child: Text(
                "3",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              alignment: Alignment.center,
              height: 200.0,
              width: 200.0,
              child: Text(
                "4",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.cyan[800],
              alignment: Alignment.center,
              height: 200.0,
              width: 200.0,
              child: Text(
                "5",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.yellow[800],
              alignment: Alignment.center,
              height: 200.0,
              width: 200.0,
              child: Text(
                "6",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}