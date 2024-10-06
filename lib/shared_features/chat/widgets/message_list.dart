import 'package:flutter/material.dart';

import '../../../shared_utils/utils/constant.dart';
import '../manager/chat_cubit.dart';
import '../widgets/chat_bubble2.dart';
import '../widgets/chat_buble.dart';

Widget messageList(ChatCubit cubit) {
  return ListView.builder(
    reverse: true,
    controller: cubit.controller,
    itemCount: cubit.messages.length,
    itemBuilder: (context, index) {
      return Constants.userType == cubit.messages[index].sender
          ? SendBuble(messageModel: cubit.messages[index])
          : RecieveBubble(messageModel: cubit.messages[index]);
    },
  );
}
