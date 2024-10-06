import 'package:flutter/material.dart';

import 'package:mindwell/doctor/features/doctor_profile/widget/profile_list.dart';

import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/utils/constant.dart';

import '../manager/doctor_profile/doctor_profile_cubit.dart';
import 'doctor_avatar.dart';
import 'doctor_bio.dart';
import 'doctor_specialty.dart';

Widget profileInfo(DoctorProfileCubit cubit,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        doctorAvatar(cubit),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctorModel!.name!, style: Styles.textStyle25Bold),
              Text(doctorModel!.email!, style: Styles.textStyle15),
              const SizedBox(height: 5),
              doctorBio(cubit,context),
              doctorSpecialty(cubit,context),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Flexible(
          child: profileList(context),
        ),
      ],
    ),
  );
}
