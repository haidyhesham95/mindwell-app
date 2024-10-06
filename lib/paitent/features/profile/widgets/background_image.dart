import 'package:flutter/material.dart';

Widget backgroundImage() {
  return Container(
    height: 200.0,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/Cream Watercolor Monday Greeting Instagram Post.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
}