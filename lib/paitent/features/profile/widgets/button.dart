import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';

class MyProfileButton extends StatelessWidget {
  const MyProfileButton({Key? key,required this.text,required this.onpressed}) : super(key: key);
  final String text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      onPressed: onpressed,
      color: ColorsAsset.kBrown,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      child:  SizedBox(
        height: 25.h > 40? 25.h : 40,
        width: 40.w > 90 ? 40.w : 90,
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle20white,

          ),
        ),
      ),
    );
  }
}