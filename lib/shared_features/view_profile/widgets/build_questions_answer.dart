import 'package:flutter/material.dart';

import '../../../shared_utils/styles/Text.dart';
import '../../../shared_utils/styles/colors.dart';

Widget buildQuestionAnswer(String question, String? answer) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        question,
        style: Styles.textStyle20,
      ),
      const SizedBox(height: 5),
      answer == null
          ? Text(
        'No Answer yet,',
        style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
      )
          : Text(
        answer,
        style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
      ),
      const SizedBox(height: 10),
    ],
  );
}
