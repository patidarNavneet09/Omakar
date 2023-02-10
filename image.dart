import 'package:flutter/material.dart';

class image1w extends StatefulWidget {
  const image1w({Key? key}) : super(key: key);

  @override
  State<image1w> createState() => _image1wState();
}

class _image1wState extends State<image1w> {
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: ScreenSize.size.height,
        width: ScreenSize.size.width,
        child: Text("gfdg"),),
    );
  }
}
