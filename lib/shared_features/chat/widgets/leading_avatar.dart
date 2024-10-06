import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/view_profile/user_details.dart';

import '../manager/chat_cubit.dart';

Widget leadingAvatar(ChatCubit cubit, int index,BuildContext context) {
  return GestureDetector(
    onTap: () {
      String userId = cubit.privateChatUser[index].id!;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserDetailsPage(userId: userId),
      ));
    },
    child: cubit.privateChatUser[index].image == ''
        ? const CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage("assets/profileavatar.jpg"),
    )
        : CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(cubit.privateChatUser[index].image.toString()),
    ),
  );
}