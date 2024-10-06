import 'package:flutter/material.dart';

import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/utils/constant.dart';
import '../manager/doctor_profile/doctor_profile_cubit.dart';
import 'add_icon.dart';

Widget doctorBio(DoctorProfileCubit cubit,BuildContext context) {
  return doctorModel!.bio == null
      ? addICon(
      getLang(context, 'Add Bio'),
      getLang(context, 'add bio'),
      cubit.bioController,
        () {
      cubit.editBio();
      Navigator.pop(context);
    },
    context
  )
      : Text(doctorModel!.bio!);
}
