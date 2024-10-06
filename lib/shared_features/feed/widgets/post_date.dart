import 'package:flutter/material.dart';

import '../../../doctor/features/add_view_screen/manager/addpost_cubit.dart';
import '../../../shared_utils/styles/Text.dart';

Widget postDate(AddPostCubit cubit, int index) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Text(
        cubit.posts[index].date.toString(),
        style: Styles.textStyle15grey,
      ),
    ),
  );
}