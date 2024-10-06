// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../../../shared_utils/components/app_local.dart';
// import '../../../../../shared_utils/styles/colors.dart';
// import '../../../../../shared_utils/utils/constant.dart';
// import '../../model/doctormodel.dart';
//
//
// part 'doctor_profile_state.dart';
//
// class DoctorProfileCubit extends Cubit<DoctorProfileState> {
//   DoctorProfileCubit() : super(DoctorProfileInitial());
//
//
//   static DoctorProfileCubit get(context) => BlocProvider.of(context);
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController bioController = TextEditingController();
//   TextEditingController specialtyController = TextEditingController();
//
//   String? name;
//   String? bio;
//   String? speciality;
//
//   void onChangeName(String? value) {
//     name = value;
//   }
//
//   void onChangeBio(String? value) {
//     bio = value;
//   }
//
//   void onChangeSpeciality(String? value) {
//     speciality = value;
//   }
//
//
//   void getDoctorInfo(String userId) {
//     FirebaseFirestore.instance.collection('doctors').doc(userId).get().then((value) {
//       doctorModel = DoctorModel.fromJson(value.data()!);
//       nameController.text = doctorModel!.name ?? '';
//       bioController.text = doctorModel!.bio ?? '';
//       specialtyController.text = doctorModel!.specialty ?? '';
//       emit(ChangeInformation());
//     }).catchError((error) {
//       emit(DoctorInfoError(error.toString()));
//     });
//   }
//
//   void editName() {
//     FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({
//       'name': name ?? doctorModel?.name ?? '',
//     }).then((value) {
//       FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).get().then((value) {
//         doctorModel = DoctorModel.fromJson(value.data());
//         emit(EditName());
//       });
//       updateDoctorDataInUserPrivateChat({'name': name ?? doctorModel?.name ?? ''});
//     });
//   }
//   void editBio() {
//     if (doctorModel == null) return;
//     FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({
//       'bio': bioController.text.trim(),
//     }).then((value) {
//       getDoctorInfo( doctorModel!.id!); // Refresh doctorModel
//       emit(EditBio());
//     });
//   }
//   // void editBio() {
//   //   FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({
//   //     'bio': bioController.text.toString(),
//   //   }).then((value) {
//   //     FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).get().then((value) {
//   //       doctorModel = DoctorModel.fromJson(value.data());
//   //       emit(EditBio());
//   //     });
//   //   });
//   // }
//   void editSpecialty() {
//     FirebaseFirestore.instance.collection('doctors')
//         .doc(doctorModel!.id)
//         .update({
//       'specialty': specialtyController.text.toString(),
//     })
//         .then((value) {
//       getDoctorInfo(
//           doctorModel!.id!
//       ); // Refresh doctorModel
//       emit(EditSpecialty());
//     });
//   }
//
//   // void getMyData() {
//   //   FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id)
//   //       .get()
//   //       .then((value) {
//   //     doctorModel = DoctorModel.fromJson(value.data()!);
//   //     emit(GetMyData());
//   //   });
//   // }
//
//
//   void updateDoctorDataInUserPrivateChat(Map<String, dynamic> newMap) {
//     FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id)
//         .collection('chat').get()
//         .then((value) {
//       for (var element in value.docs) {
//         FirebaseFirestore.instance
//             .collection('patients')
//             .doc(element.id)
//             .collection('chat')
//             .doc(doctorModel!.id)
//             .update(newMap);
//       }
//       FirebaseFirestore.instance.collection('users')
//           .doc(doctorModel!.id)
//           .update(newMap);
//     });
//   }
//
//   void showImagePicker(BuildContext context,) {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return Card(
//             child: Container(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width,
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .height / 5.2,
//                 margin: const EdgeInsets.only(top: 8.0),
//                 padding: const EdgeInsets.all(12),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                         child: InkWell(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(
//                                 Icons.image,
//                                 size: 60.0,
//                                 color: ColorsAsset.kBrown,
//                               ),
//                               Text(
//                                 getLang(context, 'Gallery'),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(fontSize: 16,
//                                     color: Colors.black),
//                               )
//                             ],
//                           ),
//                           onTap: () async {
//                             await pickImageFromGallery();
//                           },
//                         )),
//                   ],
//                 )),
//           );
//         });
//   }
//
//   String? path;
//
//   Future<void> pickImageFromGallery() async {
//     final picker = ImagePicker();
//
//     await picker.pickImage(source: ImageSource.gallery).then((value) {
//       emit(ChangeImageLoading());
//       FirebaseStorage.instance
//           .ref()
//           .child('ProfileImage/${doctorModel!.id!}')
//           .putFile(File(value!.path.toString()))
//           .then((value) {
//         value.ref.getDownloadURL().then((value) async {
//           await FirebaseFirestore.instance.collection('doctors').doc(
//               doctorModel!.id).update({'image': value});
//           await FirebaseFirestore.instance.collection("users").doc(
//               doctorModel!.id!).update({'image': value});
//           updateDoctorDataInUserPrivateChat({'image': value});
//           getDoctorInfo(
//               doctorModel!.id! // Refresh doctorModel
//           );
//           emit(ChangeImage());
//         });
//       });
//     });
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../shared_utils/components/app_local.dart';
import '../../../../../shared_utils/styles/colors.dart';
import '../../../../../shared_utils/utils/constant.dart';
import '../../model/doctormodel.dart';


part 'doctor_profile_state.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileState> {
  DoctorProfileCubit() : super(DoctorProfileInitial());

  static DoctorProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController editNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController editBioController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();
  TextEditingController editSpecialtyController = TextEditingController();

  String? name;
  String? bio;
  String? speciality;

  void onChangeName(String? value) {
    name = value;
  }

  void onChangeBio(String? value) {
    bio = value;
  }

  void onChangeSpeciality(String? value) {
    speciality = value;
  }

  void getDoctorInfo() {
    FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).get().then((value) {
      doctorModel = DoctorModel.fromJson(value.data());
      emit(ChangeInformation());
    });
  }



  void editName() {
    FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({
      'name': name ?? doctorModel?.name ?? '',
    }).then((value) {
      FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).get().then((value) {
        doctorModel = DoctorModel.fromJson(value.data());
        emit(ChangeInformation());
      });
      updateDoctorDataInUserPrivateChat({'name': name ?? doctorModel?.name ?? ''});
    });
  }

  void updateDoctorDataInUserPrivateChat(Map<String, dynamic> newMap) {
    FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).collection('chat').get().then((value) {
      for (var element in value.docs) {
        FirebaseFirestore.instance
            .collection('patients')
            .doc(element.id)
            .collection('chat')
            .doc(doctorModel!.id)
            .update(newMap);
      }
      FirebaseFirestore.instance.collection('users')
          .doc(doctorModel!.id)
          .update(newMap);

    });
  }



  void editBio() {
    FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({
      'bio': bio ?? doctorModel?.bio ?? '',
    }).then((value) {
      FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).get().then((value) {
        doctorModel = DoctorModel.fromJson(value.data());
        emit(ChangeInformation());
      });
    });
  }


  void editSpecialty() {
    FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({
      'specialty': speciality ?? doctorModel?.specialty ?? '',
    }).then((value) {
      FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).get().then((value) {
        doctorModel = DoctorModel.fromJson(value.data());
        emit(ChangeInformation());
      });
    });
  }

  void getMyData() {
    FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).get().then((value) {
      doctorModel = DoctorModel.fromJson(value.data());
      emit(GetMyData());
    });
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
                          child:  Column(
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
                                style: const TextStyle(fontSize: 16, color: Colors.black),
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

  String? path;

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery).then((value) {
      emit(ChangeImageLoading());
      FirebaseStorage.instance
          .ref()
          .child('ProfileImage/${doctorModel!.id!}')
          .putFile(File(value!.path.toString()))
          .then((value) {
        value.ref.getDownloadURL().then((value) async {
          await FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({'image': value});
          await FirebaseFirestore.instance.collection("users").doc(doctorModel!.id!).update({'image': value});
          updateDoctorDataInUserPrivateChat({'image': value});
          getMyData();
          emit(ChangeImage());
        });
      });

    });
  }
}