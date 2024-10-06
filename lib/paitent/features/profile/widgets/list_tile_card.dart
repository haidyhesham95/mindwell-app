import 'package:flutter/material.dart';

Widget listTileCard({required String title, VoidCallback? onTap}) {
  return Card(
    elevation: 3,
    child: ListTile(
      onTap: onTap,
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    ),
  );
}
