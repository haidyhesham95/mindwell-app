import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../doctor/features/add_view_screen/manager/addpost_cubit.dart';

Widget postHeader(AddPostCubit cubit, int index) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 5),
    child: Row(
      children: [
        cubit.posts[index].docImage ==null?
        const CircleAvatar(
          backgroundImage: AssetImage('assets/profileavatar.jpg'),
        ):
         CircleAvatar(
          backgroundImage: NetworkImage('${cubit.posts[index].docImage}'),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          cubit.posts[index].name.toString(),
        ),
      ],
    ),
  );
}