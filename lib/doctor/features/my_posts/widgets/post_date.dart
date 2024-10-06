import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/feed/model/post_model.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';

Widget postDate(PostModel post) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Text(
        post.date.toString(),
        style: Styles.textStyle15grey,
      ),
    ),
  );
}