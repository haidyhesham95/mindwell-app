

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../paitent/features/profile/widgets/lang_dialog.dart';
import '../../../../shared_features/auth/login/view/login_view.dart';
import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/network/local/chached_preference.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';
import '../../edit_doctor_profile/view/edit_profile_doctor.dart';
import '../../my_posts/view/my_posts.dart';

class ProfileListModel {
  final String title;
  final Function(BuildContext context) onTap;
  ProfileListModel({
    required this.title,
    required this.onTap,


  });

  static List<ProfileListModel> profileList(BuildContext context) => [
 //static List<ProfileListModel> generateProfileList(BuildContext context) {
    ProfileListModel(
        title: getLang(context, 'Edit Profile'),
        onTap: (context) => (Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EditProfileDoctor(),
            )))),
    ProfileListModel(
        title:getLang(context, 'My Posts'),
        onTap: (context) => (Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MyPosts(),
            )))),
  ProfileListModel(
  title: getLang(context, 'Language'),
  onTap: (context) {
  showDialog(
  context: context,
  builder: (BuildContext context) {
  return const LangDialog();
  });}),
    ProfileListModel(
      title: getLang(context, 'Logout'),
      onTap: (context) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Center(
                      child: Text(
                        getLang(context, 'Logout'),
                    style: Styles.textStyle25Bold,
                  )),
                  content: Text(
                    getLang(context, "Are you sure you want to logout?"),
                    style: Styles.textStyle15,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(3),
                            backgroundColor: WidgetStatePropertyAll(ColorsAsset.kBrown),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            getLang(context, 'Cancel'),
                            style: Styles.textStyle15.copyWith(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(3),
                            backgroundColor: WidgetStatePropertyAll(ColorsAsset.kBrown),
                          ),
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then((value) async {
                              if (Constants.userType == 'patient') {
                                await CacheHelper.removeData(key: 'patient');
                                await FirebaseFirestore.instance
                                    .collection('patients')
                                    .doc(patientModel!.id)
                                    .update({'token': ''});
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (builder) => const LoginView2()), (route) => false);
                              } else {
                                await CacheHelper.removeData(key: 'doctor');
                                await FirebaseFirestore.instance
                                    .collection('doctors')
                                    .doc(doctorModel!.id)
                                    .update({'token': ''});
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (builder) => const LoginView2()), (route) => false);
                              }
                            });
                          },
                          child: Text(getLang(context, 'Logout'), style: Styles.textStyle15.copyWith(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ));
      },
    ),
  ];
}
