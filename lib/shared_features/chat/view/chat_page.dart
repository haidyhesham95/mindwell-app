import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/shared_features/chat/model/chat_user_model.dart';
import 'package:mindwell/shared_features/chat/manager/chat_cubit.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';
import '../widgets/input_field.dart';
import '../widgets/message_list.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.chatUserModel}) : super(key: key);
  final ChatUserModel chatUserModel;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatCubit()..getAllMessages(receiverId: widget.chatUserModel.id!),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          ChatCubit cubit = ChatCubit.get(context);

          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    "assets/Beige Aesthetic Information Instagram Story (1).png"),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.white.withOpacity(0.8),
                elevation: 0,
                title: Text(
                  widget.chatUserModel.name!,
                  style: const TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: messageList(cubit),
                  ),
                  inputField(context, cubit, () {
                    ChatCubit cubit = ChatCubit.get(context);

                    cubit.sendMessage(
                      senderId: Constants.userType == "doctor"
                          ? doctorModel!.id!
                          : patientModel!.id!,
                      receiverId: widget.chatUserModel.id!,
                      type: 'text',
                      sender: Constants.userType,
                    );

                    cubit.sendPushMessage(
                      token: widget.chatUserModel.token!,
                      body: cubit.message!,
                      title: Constants.userType == "doctor"
                          ? doctorModel!.name!
                          : patientModel!.name!,
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
