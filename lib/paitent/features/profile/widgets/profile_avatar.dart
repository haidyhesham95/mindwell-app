import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';

import '../../edit_profile/view/edit_profile.dart';
import 'circle_avatar.dart';

Widget profileAvatar(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const EditProfile(),
      ));

    },
    child: patientModel!.image == ''
        ? const CircleAvatar(
      radius: 75.0,
      backgroundImage: AssetImage('assets/profileavatar.jpg'),
    )
        : Avatar(
      imagePath: patientModel!.image.toString(),
      radius: 75.0,
    ),
  );
}