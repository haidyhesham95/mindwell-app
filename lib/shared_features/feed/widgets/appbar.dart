import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Image.asset(
      "assets/appbar.png",
      height: 50,
    ),
  );
}