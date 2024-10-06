
import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../../shared_utils/styles/Text.dart';

Widget goChatButton(context) {
  return Container(
    decoration: BoxDecoration(color: ColorsAsset.kBrown, borderRadius: BorderRadius.circular(6)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        getLang(context,  "Chat"),
        style: Styles.textStyle15grey.copyWith(color: Colors.white),
      ),
    ),
  );
}