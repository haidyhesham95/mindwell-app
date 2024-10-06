import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

Widget noInternetContainer() {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        color: ColorsAsset.kWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 100,
      width: 300,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No Internet",
              style: TextStyle(color: ColorsAsset.kBrown, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please check your internet Connection",
              style: TextStyle(color: ColorsAsset.kBrown),
            ),
          ],
        ),
      ),
    ),
  );
}
