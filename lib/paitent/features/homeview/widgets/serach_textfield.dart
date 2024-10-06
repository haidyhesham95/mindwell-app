import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../manager/cubit/home_cubit.dart';

Widget searchTextField(BuildContext context, HomeCubit cubit) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.055,
      child: TextField(
        onChanged: (value) {
          if (value.trim().isNotEmpty) {
            cubit.changeSearch(true);
            cubit.searchDisease(value);
          } else {
            cubit.changeSearch(false);
          }
        },
        decoration: InputDecoration(
          labelStyle: GoogleFonts.dosis(color: Colors.grey, fontSize: 12),
          labelText: getLang(context, "Search for diseases"),
          filled: true,
          fillColor: Colors.white.withOpacity(0.6),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsAsset.kBrown),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsAsset.kBrown),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsAsset.kBrown),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}