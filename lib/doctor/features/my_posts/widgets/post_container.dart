import 'package:flutter/material.dart';
import 'package:mindwell/doctor/features/my_posts/widgets/post_content.dart';
import 'package:mindwell/doctor/features/my_posts/widgets/post_date.dart';
import 'package:mindwell/doctor/features/my_posts/widgets/post_header.dart';

import '../../../../shared_features/feed/model/post_model.dart';

import '../../../../shared_utils/styles/colors.dart';

Widget postContainer(PostModel post) {
  return Container(
    width: double.infinity,
    decoration:  BoxDecoration(
        color: ColorsAsset.kGround,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.15),
          )
        ]
    ),
    child: Column(
      children: [
        postHeader(post),
        postContent(post),
        postDate(post),
      ],
    ),
  );
}
