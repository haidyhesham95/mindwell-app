import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../shared_utils/styles/Text.dart';
import '../manager/chat_cubit.dart';

Widget inputField(BuildContext context,ChatCubit cubit, void Function()? onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextField(
        controller: cubit.messageController,
        decoration: _buildInputDecoration(onPressed),
      ),
    ),
  );
}

InputDecoration _buildInputDecoration(void Function()? onPressed) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: "Send Message",
    hintStyle: Styles.textStyle15,
    icon: const Icon(Icons.settings_voice),
    suffixIcon: _buildSendButton(onPressed: onPressed),
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: ColorsAsset.kBrown),
    ),
  );
}
IconButton _buildSendButton({required void Function()? onPressed}) {
  return IconButton(
    onPressed: onPressed,
    icon: const Icon(Icons.send),
  );
}