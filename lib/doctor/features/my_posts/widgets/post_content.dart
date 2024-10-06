import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/feed/model/post_model.dart';

import '../../../../shared_utils/styles/colors.dart';


Widget postContent(PostModel post) {
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
        child: Text(post.content.toString()),
      ),
    ),
  );
}
