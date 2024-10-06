import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindwell/doctor/layout/view/layout.dart';
import 'package:mindwell/shared_features/auth/models/signup_model.dart';
import 'package:mindwell/shared_utils/network/local/chached_preference.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../doctor/features/doctor_profile/manager/doctor_profile/doctor_profile_cubit.dart';
import '../../../../doctor/features/doctor_profile/model/doctormodel.dart';
import '../../../../paitent/features/profile/model/patient_model.dart';
import '../../../../paitent/layout/view/layout.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isLoadingSignUp = false;

  void changeUserType(value) {
    Constants.userType = value;
    emit(ChangeUserValue());
  }

  Future<void> signup(
    context, {
    required SignupModel signupModel,
    required String password,
  }) async {
    isLoadingSignUp = true;
    emit(IsLoading());
    String uid;
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: signupModel.email!, password: password).then((value) {
      uid = value.user!.uid;
      FirebaseFirestore.instance.collection("users").doc(uid).set(signupModel.toMap(id: uid)).then((value) {
        FirebaseFirestore.instance.collection("patients").doc(uid).set(signupModel.toMap(id: uid));
      }).then((value) {
        emailSignUpController.clear();
        nameController.clear();
        phoneController.clear();
        passwordSignUpController.clear();
        isLoadingSignUp = false;
        emit(IsLoading());
        Navigator.pop(context);
      });
    }).catchError((onError) {
      isLoadingSignUp = false;
      emit(IsLoading());
      Fluttertoast.showToast(msg: onError.message.toString());
    });
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    emit(IsLoading());
    String uid;
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      uid = value.user!.uid;
      FirebaseFirestore.instance.collection("users").doc(uid).get().then((value) async {
        Constants.userType = await value.data()!['type'];
        print(Constants.userType);

        if (Constants.userType == 'patient') {
          patientModel = PatientModel.fromJson(value.data());
          await cachingUser(value, 'patient');
          var token = await FirebaseMessaging.instance.getToken();
          FirebaseFirestore.instance
              .collection('patients')
              .doc(patientModel!.id)
              .update({'token': token}).then((value) {
            emailLoginController.clear();
            passwordLoginController.clear();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>  const NavBar(),
            ));
            isLoading = false;
            emit(IsLoading());
          });
        } else {
          doctorModel = DoctorModel.fromJson(value.data());
          await cachingUser(value, 'doctor');
          var token = await FirebaseMessaging.instance.getToken();
          FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).update({'token': token}).then((value) {
            emailLoginController.clear();
            passwordLoginController.clear();
            DoctorProfileCubit.get(context).getMyData();

            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const DoctorNavbar(),
            ));
            isLoading = false;
            emit(IsLoading());
          });
        }
      });
    }).catchError((onError) {
      isLoading = false;
      emit(IsLoading());
      Fluttertoast.showToast(msg: onError.message.toString());
    });
  }

  Future<void> cachingUser(DocumentSnapshot<Map<String, dynamic>> value, String userType) async {
    List<String> map = [];
    dynamic array = value.data().toString().split('');
    await array.removeAt(0);
    await array.removeLast();
    array = await array.join('');
    array = await array.split(',');
    await CacheHelper.setData(key: userType, value: (handlingMapResponse(array, map).toString()));
  }

  String handlingMapResponse(List array, List<String> map) {
    for (int i = 0; i < array.length; i++) {
      dynamic key = array[i].toString().trim().split(" ")[0].split("");
      var value = array[i].toString().trim().split(" ").last == array[i].toString().trim().split(" ")[0]
          ? ''
          : array[i].toString().trim().split(" ").last;
      key.removeLast();
      key = key.join();
      map.add('"$key" : "$value",');
    }
    String last = (map.last.split('')..removeLast()).join();
    map
      ..removeLast()
      ..insert(map.length, last);
    print(map.join());
    return '{${map.join().toString()}}';
  }

  bool isShowLoginPassword = true;
  bool isShowSignUpPassword = true;

  void changeLoginPasswordVisibility() {
    isShowLoginPassword = !isShowLoginPassword;
    emit(ShowPasswordInLogin());
  }

  void changeSignUpPasswordVisibility() {
    isShowSignUpPassword = !isShowSignUpPassword;
    emit(ShowPasswordInSignUp());
  }

  void updateTokens() {
    if (Constants.userType == 'doctor') {
      FirebaseFirestore.instance.collection('doctors').doc(doctorModel!.id).collection('chat').get().then((value) {
        value.docs.forEach((element) async {
          FirebaseFirestore.instance
              .collection('patients')
              .doc(element.id)
              .collection('chat')
              .doc(doctorModel!.id)
              .update({'token': await FirebaseMessaging.instance.getToken()}).then((value) async {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(doctorModel!.id)
                .update({'token': await FirebaseMessaging.instance.getToken()});
          });
        });
      });
    } else {
      FirebaseFirestore.instance.collection('patients').doc(patientModel!.id).collection('chat').get().then((value) {
        value.docs.forEach((element) async {
          FirebaseFirestore.instance
              .collection('doctors')
              .doc(element.id)
              .collection('chat')
              .doc(patientModel!.id)
              .update({'token': await FirebaseMessaging.instance.getToken()}).then((value) async {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(patientModel!.id)
                .update({'token': await FirebaseMessaging.instance.getToken()});
          });
        });
      });
    }
  }
  final String _localeKey = 'app_locale';
  late SharedPreferences _prefs;

  Locale appLocale = const Locale("en");

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final String? savedLocale = _prefs.getString(_localeKey);
    if (savedLocale != null) {
      appLocale = Locale(savedLocale);
    }
  }

  void changeAppLanguage(Locale locale) async {
    appLocale = locale;
    emit(AppSettingsChangeLanguageState(locale: locale));
    // await _prefs.setString(_localeKey, locale.languageCode);
  }
}

