import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../doctor_profile/manager/doctor_profile/doctor_profile_cubit.dart';

Widget submitButton(DoctorProfileCubit cubit,context) {
  return SizedBox(
    width: 230,
    child: ElevatedButton(
      style: const ButtonStyle(
        elevation: WidgetStatePropertyAll(3),
        backgroundColor: WidgetStatePropertyAll(ColorsAsset.kBrown),
      ),
      onPressed: () {
        cubit.editName();
        cubit.editBio();
        cubit.editSpecialty();
        Navigator.pop(context);
      },
      child: Text(getLang(context, 'Submit'), style: Styles.textStyle20.copyWith(color: Colors.white)),
    ),
  );
}