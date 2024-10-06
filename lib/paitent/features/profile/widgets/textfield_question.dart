import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';

class TextFieldQuestion extends StatelessWidget {
  const TextFieldQuestion({super.key,required this.controller});
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: ColorsAsset.kGround
                .withOpacity(0.5),
            filled: true,
            enabledBorder: const OutlineInputBorder(),
            hintText: getLang(context, 'Enter your answer'),
            hintStyle: Styles.textStyle15grey),
      ),
    );
  }
}
