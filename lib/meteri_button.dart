import 'package:flutter/material.dart';

void main() {
  runApp(MyButtonApp());
}

class MyButtonApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Aksi ketika tombol ditekan
          },
          child: Icon(Icons.thumb_up),
          backgroundColor: const Color.fromARGB(255, 33, 58, 243)),
      ),
    );
  }
}