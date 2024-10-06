import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';


AppBar customAppBar(String text) {
  return AppBar(

    elevation: 0,
    centerTitle: true,
      title: Text(text,style: Styles.textStyle25,)
  );
}