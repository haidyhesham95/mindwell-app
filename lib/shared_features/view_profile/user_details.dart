import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/view_profile/widgets/doctor_details.dart';
import 'package:mindwell/shared_features/view_profile/widgets/patient_details.dart';
import '../../paitent/features/profile/model/questin_model.dart';
import '../../shared_utils/styles/colors.dart';
import '../../shared_utils/utils/constant.dart';

class UserDetailsPage extends StatefulWidget {
  final String userId;

  const UserDetailsPage({super.key, required this.userId});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {

  String collection = Constants.userType == "patient" ? 'doctors' : 'patients';

  void getQuestions(collection) async {
    if (collection == 'patients') {
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(widget.userId)
          .collection('questions')
          .doc('questions')
          .get()
          .then((value) {
        setState(() {
          questionModel = QuestionModel.fromJson(value.data());
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getQuestions(collection);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection(collection)
          .doc(widget.userId)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: ColorsAsset.kBrown,
          ));
        }

        var userData = snapshot.data?.data();
        return Scaffold(
          appBar: AppBar(
            title: const Text('User Details'),
            centerTitle: true,
          ),
          body: collection == 'doctors'
              ? buildDoctorDetails(userData)
              : buildPatientDetails(userData),
        );
      },
    );
  }
}
