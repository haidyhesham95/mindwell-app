import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../shared_utils/styles/Text.dart';

class ShowTextWidget extends StatelessWidget {
  const ShowTextWidget({super.key, required this.data});
final String data;
  @override
  Widget build(BuildContext context) {
    return     ReadMoreText(
      data,
      style: Styles.textStyle20
          .copyWith(color: Colors.black54),
      trimLines: 6,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
          fontWeight: FontWeight.bold),
      lessStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
          fontWeight: FontWeight.bold),
    );
  }
}
