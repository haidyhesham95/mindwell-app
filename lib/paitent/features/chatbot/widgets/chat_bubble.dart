import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

class ChatBuble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBuble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CircleAvatar(
                backgroundColor: ColorsAsset.kGround,
                child: Image.asset("assets/chatboticon.png",height: 25,),
              ),
            ),
          const SizedBox(width: 5,),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width + 0.7),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: isUser ? const Color(0xFFFFE4D6) : ColorsAsset.kWhite,
                    borderRadius: !isUser ?const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft:  Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ): const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft:  Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                ),
                child: Text(text),
              ),
            ),
          ),
          if (isUser)
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0,left: 5),
              child: CircleAvatar(
                backgroundColor: ColorsAsset.kGround,
                child: Icon(Icons.person,color: ColorsAsset.kBrown,),
              ),
            )
        ],
      ),
    );
  }
}