import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/doctor/features/my_posts/widgets/post_container.dart';

import '../manager/my_posts_cubit.dart';

Widget postList(MyPostsCubit cubit) {
  return ListView.builder(
    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
    itemCount: cubit.doctorPosts.length,
    itemBuilder: (context, int index) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: postContainer(cubit.doctorPosts[index]),
        ),
      );
    },
  );
}