import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
class DeleteWarningDialog {
  DeleteWarningDialog(VoidCallback onTap,BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Alarm'),
          content: const Text('Are you sure you want to delete this alarm?'),
          actions: [
            TextButton(
              child:  const Text('Cancel',style: TextStyle(color: ColorsAsset.kBrown),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete',style: TextStyle(color: ColorsAsset.kBrown),),
              onPressed: () {
                onTap();
              },
            ),
          ],
        );
      },
    );
  }

}