import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import '../../../paitent/features/chat_with_doctor/view/chat_with_doctor.dart';
import '../../../shared_utils/styles/Text.dart';
import '../../../shared_utils/styles/colors.dart';
import '../manager/chat_cubit.dart';
import 'chat_list_item.dart';

Widget chatList(ChatCubit cubit,BuildContext context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: _buildBackgroundDecoration(),
    child:
    cubit.privateChatUser.isEmpty?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(opacity: 0.5,
              child:  Image.asset("assets/message-notification-email-chat-mail-talk_svgrepo.com.png",height: 300,),),


            const SizedBox(height: 25,),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatWithDoctor(),
                ));
              },
              color: ColorsAsset.kBrown,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              child:  SizedBox(
                height: 30.h > 45 ? 30.h : 45,
                width: 65.w > 180 ? 65.w : 180,
                child: Center(
                  child: Text(
                    getLang(context, "Start Chat")
                   ,
                    style: Styles.textStyle10sp,

                  ),
                ),
              ),
            )

          ],
        ):
    ListView.builder(
      itemCount: cubit.privateChatUser.length,
      itemBuilder: (context, int index) {
        return chatListItem(context, cubit, index);
      },
    ),
  );
}
BoxDecoration _buildBackgroundDecoration() {
  return const BoxDecoration(
    image: DecorationImage(
      opacity: 0.6,
      image: AssetImage("assets/White Green Minimalist Quotes Instagram Story (1).png"),
      fit: BoxFit.fill,
    ),
  );
}