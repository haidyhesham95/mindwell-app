import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../../shared_utils/utils/constant.dart';

Future<void> showAddAlarmDialog(BuildContext context, void Function()? onPressed) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Set Reminder'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: 'Enter title',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel',style: TextStyle(color:ColorsAsset.kBrown)
            ,),
          ),
          ElevatedButton(
            onPressed: onPressed,

            child: const Text('Add Alarm',style: TextStyle(color:ColorsAsset.kBrown)),
          ),
        ],
      );
    },
  );
}
