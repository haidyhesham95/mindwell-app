
import 'package:flutter/material.dart';

import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';

AppBar findDoctorAppbar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorsAsset.kWhite,
    centerTitle: true,
    title: Text(
      getLang(context, 'Find Doctor'),
      style: Styles.textStyle25,
    ),
  );
}