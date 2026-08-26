import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 20.0),
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            AppBar(
              title: const Text('Contoh Cupertino')
            ),
            CupertinoButton(
              child: const Text('Tombol Cupertino'),
              onPressed: () {
                // Aksi ketika tombol ditekan
              },
            ),
            CupertinoActivityIndicator(
              radius: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}