import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/view_profile/widgets/user_details_text.dart';

import 'avatar.dart';

Widget buildDoctorDetails(userData) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildUserAvatar(userData),
        const SizedBox(height: 20,),
        buildUserDetailText('Doctor Name', userData?['name']),
        buildUserDetailText('Doctor Bio', userData?['bio']),
        buildUserDetailText('Doctor Specialty', userData?['specialty']),
      ],
    ),
  );
}