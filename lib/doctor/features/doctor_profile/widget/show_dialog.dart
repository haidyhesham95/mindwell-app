import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_features/auth/widgets/custom_textfield.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key, required this.text, required this.hintText,required this.onPressed, this.controller});
final String text;
 final  String hintText;
 final TextEditingController? controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
            text,
            style: Styles.textStyle25Bold,
          )),
      content:  SizedBox(
        height: 38.h,
        child: MyTextField(
          controller: controller,
          hintText:hintText ,
          keyboardType: TextInputType.name,

        ),
      ),

      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                elevation: WidgetStatePropertyAll(3),
                backgroundColor: WidgetStatePropertyAll(ColorsAsset.kBrown),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: Styles.textStyle15.copyWith(color: Colors.white),
              ),

            ),
            ElevatedButton(
              style: const ButtonStyle(
                elevation: WidgetStatePropertyAll(3),
                backgroundColor: WidgetStatePropertyAll(ColorsAsset.kBrown),
              ),
              onPressed:onPressed,
              child: Text("Add",
                  style: Styles.textStyle15.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}
