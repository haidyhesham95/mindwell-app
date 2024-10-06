import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.hintText,
    this.controller,
    required this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.intialValue,
    this.onChanged,
    this.errorMessage,
    this.horizontal=20,  this.labelText,
  }) : super(key: key);
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  bool obscureText;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  Widget? suffixIcon;
   final double horizontal;
  final String? intialValue;
  void Function(String)? onChanged;
   final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontal),
      child: TextFormField(

        initialValue: intialValue,
        controller: controller,
        cursorColor: ColorsAsset.kBrown,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: ColorsAsset.kBrown,),
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.brown.shade400,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.brown.shade400,
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(color: Colors.brown.shade300),
          fillColor: ColorsAsset.kWhite.withOpacity(0.6),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: ColorsAsset.kBrown,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: ColorsAsset.kBrown,
                width: 1.5,
              )),
          focusedErrorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: ColorsAsset.kBrown,
                width: 1.5,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: ColorsAsset.kBrown,
                width: 1.5,
              )),

          filled: true,
          contentPadding: const EdgeInsets.all(18),
        ),
      ),
    );
  }
}
