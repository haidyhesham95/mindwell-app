import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../shared_utils/styles/Text.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key,required this.text,required this.onpressed}) : super(key: key);
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
        height: 40.h > 54 ? 40.h : 54,
        width: 80.w > 220 ? 80.w : 220,
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle10sp,

          ),
        ),
      ),
    );
  }
}
