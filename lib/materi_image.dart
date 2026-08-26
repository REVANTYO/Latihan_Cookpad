import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Image(image: NetworkImage("https://png.pngtree.com/png-vector/20240604/ourmid/pngtree-cute-little-panda-dj-music-cartoon-png-image_12618214.png")),
    );
  }
}
