import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindwell/paitent/features/profile/model/patient_model.dart';
import 'package:mindwell/paitent/features/profile/model/questin_model.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';

import '../../../../shared_utils/components/app_local.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController q1Controller = TextEditingController();
  TextEditingController q2Controller = TextEditingController();
  TextEditingController q3Controller = TextEditingController();
  TextEditingController q4Controller = TextEditingController();
  TextEditingController q5Controller = TextEditingController();
  TextEditingController q6Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String? name;

  void onChangeName(String? value) {
    name = value;
  }

  void getUserData() {
    FirebaseFirestore.instance.collection('patients').doc(patientModel!.id).get().then((value) async {
      nameController.text = patientModel!.name!;
      name=patientModel!.name!;
      await getMyData();
      emit(GetUserDataSuccessfully());
    });
  }

  Future<void> editName() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(patientModel!.id!)
        .update({
      'name': nameController.text ,
    });
    FirebaseFirestore.instance
        .collection('patients')
        .doc(patientModel!.id)
        .update({
      'name': nameController.text ,
    }).then((value) {
      FirebaseFirestore.instance
          .collection('patients')
          .doc(patientModel!.id)
          .get()
          .then((value)async {
        patientModel = PatientModel.fromJson(value.data());
        await getMyData();
        emit(ChangeInformation());
        Fluttertoast.showToast(msg: "Name Changed",backgroundColor: ColorsAsset.kBrown,);
      });
    });

  }

  //answers
  void getAnswers({
    required String id,
  }) async {
    await FirebaseFirestore.instance
        .collection("patients")
        .doc(id)
        .collection("questions")
        .doc("questions")
        .get()
        .then((value) {
      questionModel = (QuestionModel.fromJson(value.data()));
      emit(GEtAnswers());
    });
  }

  void sendQuestionsAnswer({
    required String id,
    required String question1,
    required String question2,
    required String question3,
    required String question4,
    required String question5,
    required String question6,
  }) async {
    await FirebaseFirestore.instance
        .collection("patients")
        .doc(id)
        .collection("questions")
        .doc("questions")
        .set({
      "q1": question1,
      "q2": question2,
      "q3": question3,
      "q4": question4,
      "q5": question5,
      "q6": question6,
      "id": id,
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection("patients")
          .doc(id)
          .collection("questions")
          .doc("questions")
          .get()
          .then((value) {
        questionModel = (QuestionModel.fromJson(value.data()));
        emit(GEtAnswers());
      });
    });
    emit(SendAnswers());
  }

  void showImagePicker(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image,
                            size: 60.0,
                            color: ColorsAsset.kBrown,
                          ),
                          Text(
                            getLang(context, 'Gallery'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () async {
                        await pickImageFromGallery();
                      },
                    )),
                  ],
                )),
          );
        });
  }

  Future<void> getMyData() async {
    await FirebaseFirestore.instance
        .collection('patients')
        .doc(patientModel!.id)
        .get()
        .then((value) {
      patientModel = PatientModel.fromJson(value.data());
      emit(GetMyDAta());
    });
  }

  String? path;

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();


    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      emit(ChangeImageLoading());
      FirebaseStorage.instance
          .ref()
          .child('ProfileImage/${patientModel!.id!}')
          .putFile(File(value!.path.toString()))
          .then((value) {
        value.ref.getDownloadURL().then((value) async {
          await FirebaseFirestore.instance
              .collection('patients')
              .doc(patientModel!.id)
              .update({'image': value});
          await FirebaseFirestore.instance
              .collection("users")
              .doc(patientModel!.id!)
              .update({'image': value});
          patientModel!.image=value;
          await getMyData();
          emit(ChangeInformation());
        });
      });
    });

  }
}
