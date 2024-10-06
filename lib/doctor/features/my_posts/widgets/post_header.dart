import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/shared_features/feed/model/post_model.dart';

Widget postHeader(PostModel post) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 5),
    child: Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/profileavatar.jpg'),
        ),
        SizedBox(width: 10.w),
        Text(post.name.toString()),
      ],
    ),
  );
}
