import 'package:flutter/material.dart';
import '../../../../shared_utils/styles/Text.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.data, required this.text});
  final String text ,data;

  @override
  Widget build(BuildContext context) {
    // return  Row(
    //   children: [
    //     Text(text,
    //         style: Styles.textStyle20
    //             .copyWith(fontWeight: FontWeight.w600)),
    //     Flexible(
    //       child: Text(
    //         data,
    //         style: Styles.textStyle20,
    //         textAlign: TextAlign.start,
    //         softWrap: true,
    //         maxLines: 2,
    //       ),
    //     ),
    //   ],
    // );
    return RichText(
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    text: TextSpan(
      children: [
        TextSpan(
          text: text,
            style: Styles.textStyle20
                      .copyWith(fontWeight: FontWeight.w600,color: Colors.black),),

        TextSpan(
          text: data,
          style:Styles.textStyle20.copyWith(color: Colors.black),
        ),
      ],
    ),
    );
  }
}
