import 'package:flutter/material.dart';

new MaterialApp(
  Home: new Screen1(),
  routes: <String,WidgetBuilder> {
    '/screen1': (BuildContext context) => new screen1(),
    '/screen2': (BuildContext context) => new screen2(),
    '/screen3': (BuildContext context) => new screen3(),
    '/screen4': (BuildContext context) => new screen4()

  },
)