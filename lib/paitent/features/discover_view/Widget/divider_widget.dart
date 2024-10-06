import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ColorsAsset.kBrown,
      thickness: 1,
      endIndent: 40,
      indent: 40,
    );
  }
}
