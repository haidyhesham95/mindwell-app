import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';

class ConstTextField extends StatelessWidget {
  const ConstTextField({super.key, required this.hintText, this.maxLines=1, this.onSaved, this.onChanged,this.controller});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
 final void Function(String)? onChanged;
  final TextEditingController? controller;
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration:  BoxDecoration(
            // color: ColorsAsset.kWhite,
             borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.15),
              )
            ]
        ),
        child: TextFormField(
          controller: controller,
          onChanged:onChanged ,
          onSaved: onSaved,
          maxLines: maxLines,
          cursorColor:  ColorsAsset.kBrown.withOpacity(0.7),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:TextStyle(
                color: ColorsAsset.kBrown.withOpacity(0.7),
            ),
            fillColor: ColorsAsset.kWhite,
             alignLabelWithHint: true,
             hintMaxLines: 2,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:  BorderSide(
                color: ColorsAsset.kBrown,
                width: 1.5,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),

                borderSide:  BorderSide(
              color: ColorsAsset.kBrown,
                  width:1.5,
                )
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(18),
          ),

        ),
      ),
    );
  }
}
