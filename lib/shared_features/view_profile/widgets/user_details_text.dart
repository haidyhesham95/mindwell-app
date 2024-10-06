import 'package:flutter/material.dart';

import '../../../shared_utils/styles/Text.dart';

Widget buildUserDetailText(
    String label,
    String? value,
    {FontWeight? fontWeight, double? fontSize}) {
  return Text(
    '$label: $value',
    style: Styles.textStyle30.copyWith(fontWeight: fontWeight, fontSize: fontSize),
  );
}
