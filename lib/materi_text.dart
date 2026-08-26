import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Revantyo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text ('Aplikasi Revantyo'),
        ),
        body: const Center(
          child: Text(
            'Hello World'
          )
        )
      )
    );
  }
}