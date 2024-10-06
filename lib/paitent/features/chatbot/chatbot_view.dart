import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/chatbot/widgets/chat_bubble.dart';
import 'package:mindwell/paitent/features/chatbot/widgets/typing_indicator.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import 'package:mindwell/shared_utils/styles/colors.dart';
import 'manager/chatbot_cubit.dart';

class ChatBotPage extends StatelessWidget {
  final String? search;
  const ChatBotPage({super.key, this.search});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    if (search != null) {
      ChatbotCubit.get(context).sendMessage('what is $search');
    }
    return BlocProvider(
  create: (context) => ChatbotCubit(),
  child: BlocConsumer<ChatbotCubit, ChatbotState>(
      listener: (context, state) {},
      builder: (context, state) {
        ChatbotCubit cubit = ChatbotCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/chatboticon.png",
                  scale: 2,
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text("Chatbot"),
                const SizedBox(
                  width: 2,
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: cubit.scrollController,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final message = cubit.reversedChatMessage[index];
                    return ChatBuble(
                      text: message.text,
                      isUser: message.isUser,
                    );
                  },
                  itemCount: cubit.reversedChatMessage.length,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TypingIndicator(
                  showIndicator: cubit.isTyping,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: cubit.messageController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: getLang(context, "Send Message"),
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.sendMessage(cubit.messageController.text);
                              cubit.messageController.clear();
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                        errorStyle: const TextStyle(height: 0),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: ColorsAsset.kBrown,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: ColorsAsset.kBrown,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: ColorsAsset.kBrown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
);
  }
}


// class ChatBotPage extends StatelessWidget {
//   const ChatBotPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ChatbotCubit(),
//       child: BlocConsumer<ChatbotCubit, ChatbotState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           ChatbotCubit cubit = ChatbotCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     "assets/chatboticon.png",
//                     height: 30,
//                   ),
//                   const SizedBox(
//                     width: 2,
//                   ),
//                   const Text("Chatbot"),
//                 ],
//               ),
//               centerTitle: true,
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cubit.chatMessage.length,
//                     itemBuilder: (context, index) {
//                       final message = cubit.chatMessage[index];
//                       return ChatBuble(
//                         text: message.text,
//                         isUser: message.isUser,
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     child: TextField(
//                       cursorColor: ColorsAsset.kBrown,
//                       controller: cubit.messageController,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: getLang(context, "Send Message"),
//                         hintStyle: Styles.textStyle15,
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             cubit.sendMessage(cubit.messageController.text);
//                             cubit.messageController.clear();
//                           },
//                           icon: const Icon(Icons.send,color: ColorsAsset.kBrown,),
//                         ),
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: ColorsAsset.kBrown,
//                           ),
//                         ),
//                         border: const OutlineInputBorder(
//                           borderSide:  BorderSide(
//                             color: ColorsAsset.kBrown,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(
//                             color: ColorsAsset.kBrown,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 1
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
