import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/chat/view/chats_view.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';


AppBar homeAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Image.asset(
      "assets/appbar.png",
      height: 50,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChatList(),
            ));
          },


          child: Image.asset("assets/chat_svgrepo2.com.png",color:ColorsAsset.kBrown,height: 40,width: 30,),
        ),
      ),
    ],
  );
}