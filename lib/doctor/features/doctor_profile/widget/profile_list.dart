import 'package:flutter/material.dart';

import '../model/profile_list_model.dart';

Widget profileList(context) {
  return ListView.builder(
    itemCount: ProfileListModel.profileList(context).length,
    itemBuilder: (context, index) {
      var item = ProfileListModel.profileList(context)[index];
      return Card(
        elevation: 3,
        child: ListTile(
          title: Text(item.title),
          onTap: () => item.onTap(context),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      );
    },
  );
}