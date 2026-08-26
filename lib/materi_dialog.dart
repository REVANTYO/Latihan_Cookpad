import 'package:flutter/material.dart';

void main() {
  runApp(MyDialog());
}

class MyDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:MyLayout(),
      ),
    );
  }
}

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text('Show Alert'),
        onPressed:() {
          showAlertDialog(context);
        },
      ),
    );
  }
}

//set up the button
showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
    },
  );

  //set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}