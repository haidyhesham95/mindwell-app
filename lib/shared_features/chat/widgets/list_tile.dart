import 'package:flutter/material.dart';

import '../../../shared_utils/styles/Text.dart';
import '../manager/chat_cubit.dart';
import '../view/chat_page.dart';
import 'leading_avatar.dart';

Widget listTile(BuildContext context, ChatCubit cubit, int index) {
  return Container(
    color: Colors.white,
    child: ListTile(
      onTap: () {
        _handleChatItemTap(context, cubit, index);
      },
      leading: leadingAvatar(cubit, index,context),
      title: Text(
        cubit.privateChatUser[index].name!,
        style: Styles.textStyle18,
      ),
      subtitle: Text(
        cubit.privateChatUser[index].lastMessage!,
        style: Styles.textStyle18,
      ),
      trailing: Text(
        cubit.privateChatUser[index].date!.toString(),
        style: Styles.textStyle10grey,
      ),
    ),
  );
}
void _handleChatItemTap(BuildContext context, ChatCubit cubit, int index) {
  cubit.readMessage(cubit.privateChatUser[index].id!);
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => ChatPage(chatUserModel: cubit.privateChatUser[index]),
  ));
}