import 'package:flutter/material.dart';
import 'package:mindwell/doctor/features/doctor_profile/widget/show_dialog.dart';

import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';

Widget addICon(
    String text,
    String hintText,
    TextEditingController controller,
    VoidCallback onPressed,
    BuildContext context
    ) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ShowDialog(
                text: text,
                hintText: hintText,
                controller: controller,
                onPressed: onPressed,
              );
            },
          );
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: ColorsAsset.kBrown,
          size: 15,
        ),
      ),
      const SizedBox(width: 8),
      Text(text, style: Styles.textStyle15),
    ],
  );
}