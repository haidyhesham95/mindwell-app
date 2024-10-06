import 'package:flutter/material.dart';

import '../manager/chat_cubit.dart';
import 'list_tile.dart';

Widget chatListItem(BuildContext context, ChatCubit cubit, int index) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        listTile(context, cubit, index),
        if (cubit.privateChatUser[index].unread!)
          Positioned(
            top: 20,
            child: Container(
              height: 10,
              width: 20,
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          )
      ],
    ),
  );
}