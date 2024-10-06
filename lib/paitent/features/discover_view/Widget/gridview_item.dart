import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/paitent/features/discover_view/model/book_model.dart';
import 'package:mindwell/shared_features/cached_image/cached_image.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

Widget gridviewItem(BookModel book) {
  return Card(
    color: ColorsAsset.kGround,
    child: Container(
      decoration: const BoxDecoration(
        color: ColorsAsset.kGround,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: CachedImage(
          link: book.image,
          height:115.h,
          width: double.infinity,

        ),
      ),
    ),
  );

}
