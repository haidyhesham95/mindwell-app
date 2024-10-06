import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/chat/model/message_model.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

class SendBuble extends StatelessWidget {
  const SendBuble({Key? key,required this.messageModel}) : super(key: key);
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
          borderRadius: const BorderRadius.only(
              topRight:Radius.circular(18),
              topLeft:Radius.circular(18),
              bottomLeft: Radius.circular(18)
          ),
          color: ColorsAsset.kBrown.withOpacity(0.6),

        ),

        child: Text(messageModel.text!,style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
