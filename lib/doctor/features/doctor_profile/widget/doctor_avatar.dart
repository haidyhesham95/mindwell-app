import 'package:flutter/material.dart';

import '../../../../paitent/features/profile/widgets/circle_avatar.dart';
import '../../../../shared_utils/utils/constant.dart';
import '../manager/doctor_profile/doctor_profile_cubit.dart';

Widget doctorAvatar(DoctorProfileCubit cubit) {
  return doctorModel!.image == ''
      ? const Material(
    elevation: 4,
    shape: CircleBorder(),
    child: CircleAvatar(
      radius: 60.0,
      backgroundImage: AssetImage('assets/profileavatar.jpg'),
    ),
  )
      : Material(
    elevation: 4,
    shape: const CircleBorder(),
    child: Avatar(
      radius: 60.0,
      imagePath: doctorModel!.image.toString(),
    ),
  );
}