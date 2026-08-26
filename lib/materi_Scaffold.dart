import 'package:flutter/material.dart';

void main() {
  runApp(MyScaffold());
}

class MyScaffold extends StatelessWidget {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample Code'),
        ),
        body: Center(
          child: Text(
            'Jumlah klik: $_count times'
          ),
        ),
        bottomNavigationBar: BottomAppBar(child: Container(height: 50),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => 0,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }
}