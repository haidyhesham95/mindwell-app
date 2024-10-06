import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/feed/widgets/post_content.dart';
import 'package:mindwell/shared_features/feed/widgets/post_date.dart';
import 'package:mindwell/shared_features/feed/widgets/post_header.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../doctor/features/add_view_screen/manager/addpost_cubit.dart';

Widget postCard(AddPostCubit cubit, int index) {
  return Center(
    child: Container(
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
          postHeader(cubit, index),
          postContent(cubit, index),
          postDate(cubit, index),
        ],
      ),
    ),
  );
}
