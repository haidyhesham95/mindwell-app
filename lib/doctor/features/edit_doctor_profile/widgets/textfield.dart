import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/auth/widgets/custom_textfield.dart';

Widget textField({
  void Function(String)? onChanged,
   String? initialValue,
   String? hintText,
  required TextInputType keyboardType,
   String? labelText,
  TextEditingController? controller,
}) {
  return MyTextField(
    controller:controller ,
    intialValue: initialValue,
    onChanged: onChanged,
    hintText: hintText!,
    keyboardType: keyboardType,
    labelText: labelText,

  );
}