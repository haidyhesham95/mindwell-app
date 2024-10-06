import 'package:flutter/material.dart';

import '../../../../shared_features/chat/model/chat_user_model.dart';

Widget doctorListAvatar(ChatUserModel user) {
  return user.image == ''
      ? const CircleAvatar(
    backgroundImage: AssetImage('assets/profileavatar.jpg'),
  )
      : CircleAvatar(
    backgroundImage: NetworkImage(user.image!),
  );
}