import 'package:flutter/material.dart';

import '../model/message_model.dart';

class RecieveBubble extends StatelessWidget {
  const RecieveBubble({Key? key,required this.messageModel}) : super(key: key);
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
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
              bottomRight: Radius.circular(18)
          ),
          color: const Color(0xFFFFFBF5),

        ),

        child: Text(messageModel.text!),
      ),
    );
  }
}
