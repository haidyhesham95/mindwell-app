import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import '../../../../shared_utils/utils/constant.dart';
import '../manager/doctor_profile/doctor_profile_cubit.dart';
import 'add_icon.dart';

Widget doctorSpecialty(DoctorProfileCubit cubit,BuildContext context) {
  return doctorModel!.specialty == null
      ? addICon(
    getLang(context, 'Add Specialty'),
    getLang(context, 'add specialty'),
    cubit.specialtyController,
        () {
      cubit.editSpecialty();
      Navigator.pop(context);

    },
    context
  )
      : Text(doctorModel!.specialty!);
}
