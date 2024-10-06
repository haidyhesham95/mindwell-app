import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/chat_with_doctor/widgets/go_chat_button.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import '../../../../shared_features/chat/model/chat_user_model.dart';
import '../../../../shared_features/chat/view/chat_page.dart';
import '../../../../shared_utils/styles/Text.dart';
import 'doctor_list_avatar.dart';

Widget doctorsList(List<ChatUserModel> users, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
    child: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            elevation: 3,
            child: ListTile(
              title: Text(
                users[index].name!,
                style: Styles.textStyle18,
              ),
              subtitle: Text(
                getLang(context, "Show Doctor details"),
                style: Styles.textStyle15grey,
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(chatUserModel: users[index]),
                  ));
                },
                child: goChatButton(context),
              ),
              leading: doctorListAvatar(users[index]),
            ),
          ),
        );
      },
    ),
  );
}