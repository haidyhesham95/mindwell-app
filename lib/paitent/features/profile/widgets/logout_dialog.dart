import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/auth/login/view/login_view.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/network/local/chached_preference.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                    patientModel=null;
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (builder) => const LoginView2()),
                        (route) => false);
                  } else {
                    await CacheHelper.removeData(key: 'doctor');
                    await FirebaseFirestore.instance
                        .collection('doctors')
                        .doc(doctorModel!.id)
                        .update({'token': ''});
                    doctorModel=null;
                    // ignore: use_build_context_synchronously

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (builder) => const LoginView2()),
                        (route) => false);
                  }
                });
              },
              child: Text(getLang(context,'Yes'),
                  style: Styles.textStyle15.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}
