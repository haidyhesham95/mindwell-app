import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../shared_utils/styles/Text.dart';

class Custom_TextButton extends StatelessWidget {
  Custom_TextButton({super.key,required this.text,required this.data,required this.onPressed});
  String text;
   String data;
    void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
            style:Styles.textStyle20),

          Text(
            data,
              style: GoogleFonts.courgette(
                  color:ColorsAsset.kBrown,
                  fontSize: 15)
          )
        ],
      ),
    );
  }
}