import 'package:flutter/material.dart';
void main() {
  runApp(DecorationApp());
}

class DecorationApp extends StatelessWidget {
  const DecorationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Configuration")),
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: NetworkImage(
                'https://pixnio.com/free-images/2018/12/02/2018-12-02-19-17-12.jpg'),
              fit: BoxFit.fitWidth,
            ),
            border: Border.all(
              color: Colors.black,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 200,
          width: 300,
          margin: EdgeInsets.all(20))),
    );
  }
}