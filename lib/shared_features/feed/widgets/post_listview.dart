import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/shared_features/feed/widgets/post_card.dart';

import '../../../doctor/features/add_view_screen/manager/addpost_cubit.dart';


Widget postListView(AddPostCubit cubit) {
  return ListView.separated(
    separatorBuilder: (BuildContext context, int index) {
      return  SizedBox(height: 30.h);
    },
    padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 18.w),
    itemCount: cubit.posts.length,
    itemBuilder: (context, int index) {
      return postCard(cubit, index);
    },
  );
}