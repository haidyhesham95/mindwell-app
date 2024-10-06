import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/profile/manager/profile_cubit.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';

Widget profileImageSection(BuildContext context, ProfileCubit cubit) {
  return Center(
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        patientModel!.image == ''
            ? CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.17,
          backgroundImage: const AssetImage('assets/profileavatar.jpg'),
        )
            : CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.17,
          backgroundImage: NetworkImage(patientModel!.image.toString()),
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
    ),
  );
}