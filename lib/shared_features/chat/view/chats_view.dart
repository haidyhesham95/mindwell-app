import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/shared_features/chat/manager/chat_cubit.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import '../widgets/chat_list.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ChatCubit()
        ..getPrivateChat(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          ChatCubit cubit = ChatCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                getLang(context, "Conversations"),
                style: Styles.textStyle20,
              ),
            ),
            body: chatList(cubit,context),
          );
        },
      ),
    );
  }
}