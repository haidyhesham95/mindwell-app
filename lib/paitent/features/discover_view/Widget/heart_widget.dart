import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';



class HeartWidget extends StatelessWidget {
  const HeartWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return  const CircleAvatar(
      backgroundColor:ColorsAsset.kBrown,
      radius: 25,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 2),
          child: LikeButton(
           size: 28,
           likeCountAnimationDuration: Duration(
             microseconds: 500
            ),

          ),
        ),
      ),
    );

  }
}
