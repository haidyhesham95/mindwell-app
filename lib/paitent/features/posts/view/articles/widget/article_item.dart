import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/paitent/features/discover_view/Widget/show_text_widget.dart';
import 'package:mindwell/shared_features/cached_image/cached_image.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.name, required this.description, required this.image});
  final String name;
  final String description;
  final String image;


  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImage(
            link: image,
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            borderRadius: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: Styles.textStyle25Bold,),
                SizedBox(height: 15.h,),
                 ShowTextWidget(data: description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}