import 'package:flutter/material.dart';

import '../../../doctor/features/add_view_screen/manager/addpost_cubit.dart';
import '../../../shared_utils/styles/colors.dart';

Widget postContent(AddPostCubit cubit, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: ColorsAsset.kBrown.withOpacity(0.3),
        ),
        //color: ColorsAsset.kBrown.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Text(
          cubit.posts[index].content.toString(),
        ),
      ),
    ),
  );
}
