import 'package:flutter/material.dart';

Widget expansion(String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      ExpansionTile(
        title:  Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Text(content),
        ],
      ),
      const SizedBox(height: 10),
    ],
  );
}