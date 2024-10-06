import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';
import '../../doctor_profile/manager/doctor_profile/doctor_profile_cubit.dart';

Widget profileImage(DoctorProfileCubit cubit,BuildContext context) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      doctorModel!.image == ''
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
        child: CircleAvatar(
          radius: 60.0,
          backgroundImage: NetworkImage(doctorModel!.image.toString()),
        ),
      ),
      InkWell(
        onTap: () {
          cubit.showImagePicker(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.width * 0.08,
          margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.01,
            top: MediaQuery.of(context).size.width * 0.01,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: ColorsAsset.kBrown),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.mode_edit_outlined,
            color: Colors.black,
            size: MediaQuery.of(context).size.width * 0.042,
          ),
        ),
      ),
    ],
  );
}