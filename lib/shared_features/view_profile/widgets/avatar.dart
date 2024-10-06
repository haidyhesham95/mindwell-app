import 'package:flutter/material.dart';

import '../../../paitent/features/profile/widgets/circle_avatar.dart';

Widget buildUserAvatar(userData) {
  return userData?['image'] == ''
      ? const CircleAvatar(
    radius: 80.0,
    backgroundImage: AssetImage('assets/profileavatar.jpg'),
  )
      : Avatar(
    imagePath: userData?['image'],
    radius: 80.0,
  );
}